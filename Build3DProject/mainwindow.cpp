/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the demonstration applications of the Qt Toolkit.
**
**
****************************************************************************/
#include "PreDefs.h"
#include "mainwindow.h"
#include "colorswatch.h"
#include "toolbar.h"
#include "AdapterWidget.h"
#include "BuildingData.h"
#include "thumbnailthread.h"
#include "textio.h"
#include <QtGui>
#include <QLayout>
#include <QMessageBox>
#include <QDockWidget>
#include <tchar.h>
#include <QFileInfo>
#include <QFileDialog>
#include <fstream>
#include <iostream>
#include <io.h>
#include <sstream>
#include <osgUtil/Optimizer>
Q_DECLARE_METATYPE(QDockWidget::DockWidgetFeatures)

int MainWindow::i=0;
int MainWindow::j=0;
MainWindow::MainWindow(const QMap<QString, QSize> &customSizeHints,
                        QWidget *parent, Qt::WindowFlags flags)
    : QMainWindow(parent, flags)
{
    setObjectName("MainWindow");
    setWindowTitle("3D Building Reconstruction");

	_glWidget = new ViewerQT;
    _glWidget->setMinimumSize(400, 400);
    setCentralWidget(_glWidget);

    setupToolBar();
    setupMenuBar();
    setupDockWidgets(customSizeHints);

    statusBar()->showMessage(tr("Status Bar"));

	//
	m_pBuildingData = new CBuildingData;
}

void MainWindow::actionTriggered(QAction *action)
{
    qDebug("action '%s' triggered", action->text().toLocal8Bit().data());
}

//setup Tool Bar include open pictures , model and build model
void MainWindow::setupToolBar()
{
	setIconSize(QSize(32, 32));
	// set open model button
	QToolBar* toolBar1 = addToolBar(tr("Tool Bar 1"));
	QAction* openAction = new QAction(QIcon("./res/open_model.png"), tr("&Open"), this);
	connect(openAction, SIGNAL(triggered()), SLOT(loadmodel()));

	//set open pictures button
	QAction *openPics = new QAction(tr("&Pics"), this);
	openPics->setShortcut(QKeySequence::Open);
	openPics->setStatusTip(tr("Open Pictures..."));
	openPics->setIcon(QIcon("./res/open_picture.png"));
	connect(openPics , SIGNAL(triggered()) ,  this , SLOT (openFiles()));

	//set build model button
	QAction *buildModel = new QAction(tr("&Build") ,this);
	buildModel->setStatusTip(tr("Build Model..."));
	buildModel->setIcon(QIcon("./res/build.png"));
	connect(buildModel , SIGNAL(triggered()) ,  this , SLOT (buildModel()));

	//set config button
	QAction *config = new QAction(tr("&Config") ,this);
	config->setStatusTip(tr("config.."));
	config->setIcon(QIcon("./res/config.png"));

	//set search button
	QAction *search = new QAction(tr("&Search") ,this);
	search->setStatusTip(tr("Search.."));
	search->setIcon(QIcon("./res/search.png"));

	//set  help button
	QAction *help = new QAction(tr("&help") ,this);
	help->setStatusTip(tr("help.."));
	help->setIcon(QIcon("./res/help.png"));

	toolBar1->addAction(openPics);
	toolBar1->addAction(buildModel);
	toolBar1->addAction(openAction);

	toolBar1->addAction(config);
	toolBar1->addAction(search);
	toolBar1->addAction(help);
	
    //for (int i = 0; i < 3; ++i) {
    //    ToolBar *tb = new ToolBar(QString::fromLatin1("Tool Bar %1").arg(i + 1), this);
    //    toolBars.append(tb);
    //    addToolBar(tb);
    //}
}

void MainWindow::setupMenuBar()
{
    QMenu *menu = menuBar()->addMenu(tr("&File"));

	QAction *action = menu->addAction(tr("Load model"));
	connect(action, SIGNAL(triggered()), this, SLOT(loadmodel()));

    action = menu->addAction(tr("Save model"));
    connect(action, SIGNAL(triggered()), this, SLOT(savemodel()));

	menu->addSeparator();

    action = menu->addAction(tr("Switch layout direction"));
    connect(action, SIGNAL(triggered()), this, SLOT(switchLayoutDirection()));

    menu->addSeparator();

    menu->addAction(tr("&Quit"), this, SLOT(close()));

    mainWindowMenu = menuBar()->addMenu(tr("Main window"));

    action = mainWindowMenu->addAction(tr("Animated docks"));
    action->setCheckable(true);
    action->setChecked(dockOptions() & AnimatedDocks);
    connect(action, SIGNAL(toggled(bool)), this, SLOT(setDockOptions()));

    action = mainWindowMenu->addAction(tr("Allow nested docks"));
    action->setCheckable(true);
    action->setChecked(dockOptions() & AllowNestedDocks);
    connect(action, SIGNAL(toggled(bool)), this, SLOT(setDockOptions()));

    action = mainWindowMenu->addAction(tr("Allow tabbed docks"));
    action->setCheckable(true);
    action->setChecked(dockOptions() & AllowTabbedDocks);
    connect(action, SIGNAL(toggled(bool)), this, SLOT(setDockOptions()));

    action = mainWindowMenu->addAction(tr("Force tabbed docks"));
    action->setCheckable(true);
    action->setChecked(dockOptions() & ForceTabbedDocks);
    connect(action, SIGNAL(toggled(bool)), this, SLOT(setDockOptions()));

    action = mainWindowMenu->addAction(tr("Vertical tabs"));
    action->setCheckable(true);
    action->setChecked(dockOptions() & VerticalTabs);
    connect(action, SIGNAL(toggled(bool)), this, SLOT(setDockOptions()));

    QMenu *toolBarMenu = menuBar()->addMenu(tr("Tool bars"));
    for (int i = 0; i < toolBars.count(); ++i)
        toolBarMenu->addMenu(toolBars.at(i)->menu);

    dockWidgetMenu = menuBar()->addMenu(tr("&Dock Widgets"));
}

void MainWindow::setDockOptions()
{
    DockOptions opts;
    QList<QAction*> actions = mainWindowMenu->actions();

    if (actions.at(0)->isChecked())
        opts |= AnimatedDocks;
    if (actions.at(1)->isChecked())
        opts |= AllowNestedDocks;
    if (actions.at(2)->isChecked())
        opts |= AllowTabbedDocks;
    if (actions.at(3)->isChecked())
        opts |= ForceTabbedDocks;
    if (actions.at(4)->isChecked())
        opts |= VerticalTabs;

    QMainWindow::setDockOptions(opts);
}

void MainWindow::savemodel()
{
    QString fileName
        = QFileDialog::getSaveFileName(this, tr("Save model"));
    if (fileName.isEmpty())
        return;


}

QAction *addAction(QMenu *menu, const QString &text, QActionGroup *group, QSignalMapper *mapper,
                    int id)
{
    bool first = group->actions().isEmpty();
    QAction *result = menu->addAction(text);
    result->setCheckable(true);
    result->setChecked(first);
    group->addAction(result);
    QObject::connect(result, SIGNAL(triggered()), mapper, SLOT(map()));
    mapper->setMapping(result, id);
    return result;
}

void MainWindow::setupDockWidgets(const QMap<QString, QSize> &customSizeHints)
{
    qRegisterMetaType<QDockWidget::DockWidgetFeatures>();

    mapper = new QSignalMapper(this);
    connect(mapper, SIGNAL(mapped(int)), this, SLOT(setCorner(int)));

    QMenu *corner_menu = dockWidgetMenu->addMenu(tr("Top left corner"));
    QActionGroup *group = new QActionGroup(this);
    group->setExclusive(true);
    ::addAction(corner_menu, tr("Top dock area"), group, mapper, 0);
    ::addAction(corner_menu, tr("Left dock area"), group, mapper, 1);

    corner_menu = dockWidgetMenu->addMenu(tr("Top right corner"));
    group = new QActionGroup(this);
    group->setExclusive(true);
    ::addAction(corner_menu, tr("Top dock area"), group, mapper, 2);
    ::addAction(corner_menu, tr("Right dock area"), group, mapper, 3);

    corner_menu = dockWidgetMenu->addMenu(tr("Bottom left corner"));
    group = new QActionGroup(this);
    group->setExclusive(true);
    ::addAction(corner_menu, tr("Bottom dock area"), group, mapper, 4);
    ::addAction(corner_menu, tr("Left dock area"), group, mapper, 5);

    corner_menu = dockWidgetMenu->addMenu(tr("Bottom right corner"));
    group = new QActionGroup(this);
    group->setExclusive(true);
    ::addAction(corner_menu, tr("Bottom dock area"), group, mapper, 6);
    ::addAction(corner_menu, tr("Right dock area"), group, mapper, 7);

    dockWidgetMenu->addSeparator();

    static const struct Set {
        const char * name;
        uint flags;
        Qt::DockWidgetArea area;
    } sets [] = {
#ifndef Q_WS_MAC
        { "Black", 0, Qt::LeftDockWidgetArea },
#else
        { "Black", Qt::Drawer, Qt::LeftDockWidgetArea },
#endif
       /* { "White", 0, Qt::RightDockWidgetArea },
       { "Red", 0, Qt::TopDockWidgetArea },
		{ "Green", 0, Qt::TopDockWidgetArea },
		{ "Yellow", 0, Qt::BottomDockWidgetArea },
        { "Blue", 0, Qt::BottomDockWidgetArea }*/
    };
    const int setCount = sizeof(sets) / sizeof(Set);

    for (int i = 0; i < setCount; ++i) 
	{
        //ColorSwatch *swatch = new ColorSwatch(tr(sets[i].name), this, Qt::WindowFlags(sets[i].flags));
		ColorSwatch* swatch;
        if (qstrcmp(sets[i].name, "Blue") == 0) 
		{
			swatch = new TextIO(tr(sets[i].name), this, Qt::WindowFlags(sets[i].flags));
            BlueTitleBar *titlebar = new BlueTitleBar(swatch);
            swatch->setTitleBarWidget(titlebar);
            connect(swatch, SIGNAL(topLevelChanged(bool)), titlebar, SLOT(updateMask()));
            connect(swatch, SIGNAL(featuresChanged(QDockWidget::DockWidgetFeatures)), titlebar, SLOT(updateMask()), Qt::QueuedConnection);

#ifdef Q_WS_QWS
            QPalette pal = palette();
            pal.setBrush(backgroundRole(), QColor(0,0,0,0));
            swatch->setPalette(pal);
#endif

        }
		else
			swatch = new ColorSwatch(tr(sets[i].name), this, Qt::WindowFlags(sets[i].flags));

        QString name ;
		
        if (customSizeHints.contains(name))
            swatch->setCustomSizeHint(customSizeHints.value(name));
		//QSize size = new QSize(centralWidget()->width(), centralWidget()->height());	
		//swatch->setCustomSizeHint(& size);
			if(qstrcmp(sets[i].name, "Black") == 0)
			{
				pScroll = new QScrollArea(swatch);	
				swatch->setWidget(pScroll);
				
				previewwidget = new QWidget(pScroll);
				pScroll->setWidget(previewwidget);
				
				previewwidget->setAutoFillBackground(true);
				previewwidget->setFixedSize(200, 200);
				picGird = new QGridLayout(previewwidget);
				previewwidget->setLayout(picGird);
			}

        addDockWidget(sets[i].area, swatch);
        dockWidgetMenu->addMenu(swatch->menu);
    }
 
	////ColorSwatch* swatch = new ColorSwatch(tr(sets[0].name), this, Qt::WindowFlags(sets[0].flags));
	//QDockWidget *blackDockWidget = new QDockWidget(tr("PicturesViewer"));
	//blackDockWidget->setAllowedAreas(Qt::LeftDockWidgetArea | Qt::RightDockWidgetArea); 
	////blackDockWidget->setFeatures();
 //     /*  QString name = QString::fromLatin1(sets[0].name);
 //       if (customSizeHints.contains(name))
 //           swatch->setCustomSizeHint(customSizeHints.value(name));*/
	//	
	//	pScroll = new QScrollArea(blackDockWidget);	
	//	blackDockWidget->setWidget(pScroll);
	//	
	//	previewwidget = new QWidget(pScroll);
	//	pScroll->setWidget(previewwidget);

	//	previewwidget->setAutoFillBackground(true);
	//	picGird = new QGridLayout(previewwidget);
	//	previewwidget->setLayout(picGird);
 //       addDockWidget(sets[0].area, blackDockWidget);
		
}

void MainWindow::setCorner(int id)
{
    switch (id) {
        case 0:
            QMainWindow::setCorner(Qt::TopLeftCorner, Qt::TopDockWidgetArea);
            break;
        case 1:
            QMainWindow::setCorner(Qt::TopLeftCorner, Qt::LeftDockWidgetArea);
            break;
        case 2:
            QMainWindow::setCorner(Qt::TopRightCorner, Qt::TopDockWidgetArea);
            break;
        case 3:
            QMainWindow::setCorner(Qt::TopRightCorner, Qt::RightDockWidgetArea);
            break;
        case 4:
            QMainWindow::setCorner(Qt::BottomLeftCorner, Qt::BottomDockWidgetArea);
            break;
        case 5:
            QMainWindow::setCorner(Qt::BottomLeftCorner, Qt::LeftDockWidgetArea);
            break;
        case 6:
            QMainWindow::setCorner(Qt::BottomRightCorner, Qt::BottomDockWidgetArea);
            break;
        case 7:
            QMainWindow::setCorner(Qt::BottomRightCorner, Qt::RightDockWidgetArea);
            break;
    }
}

void MainWindow::showEvent(QShowEvent *event)
{
    QMainWindow::showEvent(event);
}

void MainWindow::switchLayoutDirection()
{
    if (layoutDirection() == Qt::LeftToRight)
        qApp->setLayoutDirection(Qt::RightToLeft);
    else
        qApp->setLayoutDirection(Qt::LeftToRight);
}

// Load model from files
void MainWindow::loadmodel()
{
	QString fileName = QFileDialog::getOpenFileName(this, tr("Load model"));
	if (fileName.isEmpty())
		return;
	QByteArray ba = fileName.toLatin1();
	std::string fn(ba.data());

	_glWidget->ClearModelNode();

	std::fstream _file;		
	_file.open(fn.c_str() ,std::ios::in );
	if(_file.fail())
	{
		qDebug()<<"list is not exist";	
		return;
	};	

	std::string line ;
	int flag = 0;
	for( int i=0; i<30 ;i++ )
	{
		getline(_file, line,' ');
		if(line=="float32"||line=="float"||line=="uchar")	
			flag ++;
	}
	
	if(flag == 9)
	{

		m_pBuildingData->load_3d_data(fn);
		// Set draw geometry
		osg::ref_ptr<osg::Geode> geode = new osg::Geode;
		osg::ref_ptr<osg::Geometry> geom = new osg::Geometry;
		geom->setVertexArray(m_pBuildingData->m_3DBuildingVrts.get());
		geom->setColorArray(m_pBuildingData->m_3DBuildingClrs.get());	
		
		geom->setColorBinding(osg::Geometry::BIND_PER_VERTEX);		
		geom->addPrimitiveSet(new osg::DrawArrays(osg::PrimitiveSet::POINTS, 0, m_pBuildingData->m_3DBuildingVrts->size()));
	
		osg::StateSet* sset = geom->getOrCreateStateSet();
		//sset->setMode(GL_LIGHTING, osg::StateAttribute::OFF );
		osg::Point* p = new osg::Point;
		p->setSize(4.0f);
		sset->setAttribute(p);
		
		geode->addDrawable(geom);

		osg::ref_ptr<osg::MatrixTransform> mt = new osg::MatrixTransform;
		osg::Matrix m;
		m.makeRotate(osg::PI/2.0, 1.f, 0.f, 0.f);
		mt->setMatrix(m);
		mt->addChild(geode.get());

		osgUtil::Optimizer optimizer;
		optimizer.optimize(mt.get());
		_glWidget->setSceneData(mt);	
		
		/*
		osg::Geode* geode = new osg::Geode();    
		osg::Geometry* geom = new osg::Geometry();   
 
		osg::Vec3Array* v= new osg::Vec3Array();   
		v->push_back(osg::Vec3(0.0f,0.0f,0.0f));   
		v->push_back(osg::Vec3(1.0f,0.0f,0.0f));   
		v->push_back(osg::Vec3(1.0f,0.0f,1.0f));   
		v->push_back(osg::Vec3(0.0f,0.0f,1.0f));   
		v->push_back(osg::Vec3(0.0f,-1.0f,0.0f));     
		geom->setVertexArray(m_pBuildingData->m_3DBuildingVrts.get());   

		osg::DrawElementsUInt* quad= new osg::DrawElementsUInt(osg::PrimitiveSet::QUADS,0);     
		quad->push_back(0);   
		quad->push_back(1);   
		quad->push_back(2);   
		quad->push_back(3);   
 
		//geom->addPrimitiveSet(quad);   

		osg::DrawElementsUInt* triangle = new osg::DrawElementsUInt(osg::PrimitiveSet::TRIANGLES,0);    
		triangle->push_back(4);   
		triangle->push_back(0);   
		triangle->push_back(3);   

		//geom->addPrimitiveSet(triangle);   
 
		osg::Vec4Array* vc = new osg::Vec4Array();    
		vc->push_back(osg::Vec4(1.0f,0.0f,0.0f,1.0f));   
		//vc->push_back(osg::Vec4(0.0f,1.0f,0.0f,1.0f));   
		//vc->push_back(osg::Vec4(0.0f,0.0f,1.0f,1.0f));   
		//vc->push_back(osg::Vec4(1.0f,1.0f,0.0f,1.0f));   

		osg::TemplateIndexArray<unsigned int ,osg::Array::UIntArrayType,4,4>* colorIndex =    
			new osg::TemplateIndexArray<unsigned int ,osg::Array::UIntArrayType,4,4>();   
		colorIndex->push_back(0);   
		colorIndex->push_back(1);   
		colorIndex->push_back(2);   
		colorIndex->push_back(3);   
		colorIndex->push_back(2);   

		geom->setColorArray(m_pBuildingData->m_3DBuildingClrs.get());    
		geom->setColorBinding(osg::Geometry::BIND_PER_VERTEX);   
		geom->addPrimitiveSet(
			new osg::DrawArrays(osg::PrimitiveSet::POINTS, 0, m_pBuildingData->m_3DBuildingVrts->size()));
		osg::Vec3Array* nc = new osg::Vec3Array();   		  
		nc->push_back(osg::Vec3(0.0f,-1.0f,0.0f));   
		geom->setNormalArray(nc);     
		geom->setNormalBinding(osg::Geometry::BIND_OVERALL);   

		geode->addDrawable(geom);  
		_glWidget->setSceneData(geode);	
	
		*/
		/*
		osg::ref_ptr<osg::Geometry> geom = new osg::Geometry();
		geom->setVertexArray(m_pBuildingData->m_3DBuildingVrts.get());
		geom->setColorArray(m_pBuildingData->m_3DBuildingClrs.get());
		geom->setColorBinding(osg::Geometry::BIND_PER_VERTEX);

		osg::Vec3Array* normals = new osg::Vec3Array;
		normals->push_back(osg::Vec3(0.0f,-1.0f,0.0f));
		geom->setNormalArray(normals);
		geom->setNormalBinding(osg::Geometry::BIND_OVERALL);

		geom->addPrimitiveSet(
			new osg::DrawArrays(osg::PrimitiveSet::POINTS, 0, m_pBuildingData->m_3DBuildingVrts->size()));
		osg::ref_ptr<osg::Geode> geode = new osg::Geode;
		geode->addDrawable(geom.get());

		osg::StateSet* stateset = geode->getOrCreateStateSet();
		stateset->setMode(GL_LIGHTING,osg::StateAttribute::OFF);
		_glWidget->setSceneData(geode);	
		*/
	}
	else
	{
		//read vertex directly
		osg::ref_ptr<osg::Node> loadedModel = osgDB::readNodeFile(fn.c_str());
		osg::ref_ptr<osg::Group> root = new osg::Group();
		root->addChild(loadedModel.get());

		osgUtil::Optimizer optimizer;
		optimizer.optimize(root.get());

		_glWidget->setSceneData(root.get());
	}
		
	_file.clear();	

	_glWidget->ResetCameraPara();
	_glWidget->update();
}

//open pictures 
void MainWindow::openFiles()
{
	i = 0;
	j = 0;
	picList.clear();
	qDebug()<<picGird->count();
	for(int k=0;k<picGird->count();k++)
		picGird->removeItem(picGird->itemAt(k));

	waitseconds = 1;//reset
	QStringList list ;
	//
	picDir=QFileDialog::getExistingDirectory(this, tr("Please choose a directory of pictures!"),QDir::currentPath(), 
																									QFileDialog::DontResolveSymlinks | QFileDialog::ShowDirsOnly);
	if (!picDir.isEmpty() )
{
		QDir *dir = new QDir(picDir);
		QStringList filter ;
		filter<<"*.jpg";
		dir->setNameFilters(filter);
		list=dir->entryList(filter);
		qDebug()<<picDir;		
	}

	picList = picList+list;
	if( list.count() == 0)
	{
		return;
	}

	//open files one by one, and create thread to create thumbnail for each file
	QStringList::Iterator it = list.begin();
	while(it != list.end()) 
	{					
     		
			QString tt = picDir+"\\"+*it;
			createThumbnail(tt);		
			qDebug()<<tt;
     		++it;
 	}
}

void MainWindow::createThumbnail(const QString& filename)
{
	//qDebug() << filename;
	QThread* thread = new ThumbnailThread(filename, waitseconds);
	waitseconds = waitseconds + 0.3;
	connect(thread, SIGNAL(thumbnailFinished(QImage)), this, SLOT(addThumbnail(QImage)));
	connect(thread, SIGNAL(thumbnailFailed(const QString)), this, SLOT(showError(const QString)));
	connect(thread, SIGNAL(finished()), this, SLOT(deleteThread()));
	thread->start();
}

void MainWindow::deleteThread()
{
	QObject* obj = sender();
	ThumbnailThread * th = qobject_cast<ThumbnailThread*>(obj);
	//qDebug() << "delete thread..." << th->waitseconds();
	obj->deleteLater();
}

void MainWindow::addThumbnail(QImage smallpm)
{
	const int lineSize = 5;
	//qWarning() << "thumbnail create successfully..." ;
	//qWarning() << "Small PM:" << smallpm << smallpm.size();
	QLabel* label = new QLabel;
	label->setPixmap(QPixmap::fromImage(smallpm));
	picGird->addWidget(label, i,j);
	label->show();
	//qWarning() << "Label:" <<label << label->isVisible();
	j++;
	if( j > previewwidget->width()/ smallpm.width() && j < lineSize)
		previewwidget->setFixedWidth(  previewwidget->width() + 20 + smallpm.width());
	else if (j >=lineSize)
	{
		j=0;
		i++;
		if(i > previewwidget->height() / smallpm.height())
			previewwidget->setFixedHeight(previewwidget->height() +10+smallpm.height());
	}
	
}

void MainWindow::showError(const QString filename)
{
	QMessageBox::information(this, "Error!", filename+" is not a valid picture file.");
}

void MainWindow::buildModel()
{
	//warining information
	if( picList.count() == 0)
	{
		QMessageBox::warning(this, "warning", "Please open some pictrues first!", QMessageBox::Yes);
		return;
	}
	
	//get application   path
	QTextCodec *code = QTextCodec::codecForName("gb18030"); 
	char szAppPath[MAX_PATH]; 
	GetModuleFileName(NULL, szAppPath, MAX_PATH);
	(strrchr(szAppPath, '\\'))[0] = 0; 
	(strrchr(szAppPath, '\\'))[1] = 0;
	std::string appPath(szAppPath);
	QString temp = QString ::fromLocal8Bit(appPath.c_str());
	temp.replace(QString("\\") , QString("/"));
	std::string path = code->fromUnicode(temp).data();  
	qDebug()<<path.c_str();

	//delete model_data directory 
	std::string modelPath = appPath+"model_data";
	if( !CreateDirectory(modelPath.c_str(), NULL) )
	{
		deleteDir(modelPath);
	}else
		qDebug()<<"modelPath !!";
			
	//delete all txt file
	std::string deleteTxt = "cd "+appPath+"&&del/f *.txt";
	system(deleteTxt.c_str());

	//get pictures path
	std::string picPath = code->fromUnicode(picDir).data();  
	qDebug()<<"picPath"<<picPath.c_str();
	//picDir.replace(QString("\\") , QString("/"));
	QString relativePath = picDir;
	relativePath.replace(QString("\\") , QString("/"));
	relativePath.remove(0 , temp.count());
	QString  runBundlePath = "./RunBundler.sh  \"" +relativePath + " \"";	 

	// call  bundler to build first model
	std::string paraCygwin = code->fromUnicode(runBundlePath).data();  
	std::string pathCygwin="D://cygwin//bin//mintty.exe";
	qDebug()<<paraCygwin.c_str();
	callApp(pathCygwin , paraCygwin);  

	// !!clear widget when open dir
	//modify list.txt path to absolute path(\) and modify pictures' name in visualize dir drop .rd 	
	modifyListTXT( appPath, picPath , code->fromUnicode(relativePath).data());
	


	//call Bundle2PMVS to produce camera parameters
	std::string pathB2P=appPath+"bin\\Bundle2PMVS.exe";
	std::string paraB2P = "\""+appPath+"list.txt \"  " +"\""+appPath+"bundle\\bundle.out \"  ";
	qDebug()<<"pathb2p"<<paraB2P.c_str();
	callApp(pathB2P , paraB2P);


	//call RadialUndistort to produce camera parameters
	std::string pathRadia=appPath+"bin\\RadialUndistort.exe";
	std::string paraRadia =  "\""+appPath+"list.txt \"  " +"\""+appPath+"bundle\\bundle.out \"  ";
	callApp(pathRadia , paraRadia);


	//build directory of pmvs2
	std::string dir = "md  "+appPath+ "model_data";
	std::string model ="md  "+appPath+ "model_data\\models ";
	std::string txt = "md  "+appPath+ "model_data\\txt";
	std::string visualize = "md  "+appPath+ "model_data\\visualize ";
	system(dir.c_str());
	system(model.c_str());
	system(txt.c_str());
	system(visualize.c_str());
	
	
	//std::string pics  = appPath+"example\\ET\\*.jpg\0";
	//std::string to = appPath+ "model_data\\visualize\0 ";
	//cpfiles(pics , to);

	//copy  pictures to directory above and modify their name from *.rd.jpg to *.jpg
	QStringList::Iterator it =picList.begin();
	int num = 0;
	while(it != picList.end()) 
	{						
			QString tt = picDir+"\\"+*it;
			QFileInfo fi (tt);	
			
			std::string  basename =  code->fromUnicode(fi.baseName()).data();
			std::string pcopy =  "copy  "+picPath+"\\"+basename+".rd.jpg   "+appPath+ "model_data\\visualize\\"; 
			std::string isExist = picPath+"\\"+basename+".rd.jpg";
			if(isPicExsit(isExist))
			{
				system(pcopy.c_str());
				//qDebug()<<pcopy.c_str();

				std::stringstream newstr ;	
				newstr<<num;
				std::string numstr = newstr.str();
				std::string oldname = appPath+ "model_data\\visualize\\"+basename+".rd.jpg";
				std::string newname ;
				if(num<10 && num >=0)
				{								
					newname = appPath+ "model_data\\visualize\\000"+numstr+".jpg";
					qDebug()<<newname.c_str();
				}
				else if(num>=10 && num <100)
					newname = appPath+ "model_data\\visualize\\00"+numstr+".jpg";
				else if(num>=100 && num<1000)
					newname = appPath+ "model_data\\visualize\\0"+numstr+".jpg";
				std::string deletename = "del  "+appPath+ "model_data\\visualize\\"+basename+".rd.jpg";
				//modifyPicName(oldname , newname);
				rename(oldname.c_str() , newname.c_str());
				system(deletename.c_str());				
				num++;
			}
			++it;
 	}


	//camera parameters txt to directory above
	std::string cameratxt = appPath+"\\*.txt\0";
	std::string txtto = appPath+"model_data\\txt\0";
	cpfiles(cameratxt , txtto);

	//copy  bundle.rd.out  to directory above
	std::string rdout = "copy  "+appPath+"bundle.rd.out  "+appPath+ "model_data\\";
	system(rdout.c_str());

	//call cmvs
	std::string pathCmvs = appPath+"Win32-VS2010\\cmvs.exe";
	std::string paraCmvs = appPath+"model_data\\";
	qDebug()<<"paraCMVS"<<paraCmvs.c_str();
	callApp(pathCmvs , paraCmvs);

	//call genOption
	std::string pathGen = appPath+"Win32-VS2010\\genOption.exe";
	std::string paraGen =appPath+"model_data\\";
	callApp(pathGen  , paraGen);

	//call pmvs2
	std::string pathPmvs2 = appPath+"Win32-VS2010\\pmvs2.exe";
	std::string paraPmvs2 = appPath+"model_data\\ option-0000";
	callApp(pathPmvs2 , paraPmvs2);

}

void MainWindow::callApp(std::string appPath , std::string paraPath)
{
	SHELLEXECUTEINFO ShExecInfo  = {0};
	ShExecInfo.cbSize = sizeof(SHELLEXECUTEINFO); 
	ShExecInfo.fMask = SEE_MASK_NOCLOSEPROCESS; 
	ShExecInfo.hwnd = NULL; 
	ShExecInfo.lpVerb = _T("open"); 
	ShExecInfo.lpFile = _T(appPath.c_str()); 
	ShExecInfo.lpParameters =  _T(paraPath.c_str());
	ShExecInfo.lpDirectory = NULL; 
	ShExecInfo.nShow = SW_NORMAL; // SW_HIDE
	ShExecInfo.hInstApp = NULL; 
	ShellExecuteEx(&ShExecInfo);
	WaitForSingleObject(ShExecInfo.hProcess,INFINITE);
	CloseHandle(ShExecInfo.hProcess);   
}

void MainWindow::cpfiles(std::string from , std::string to)
{
		SHFILEOPSTRUCT   lpfile; 
		lpfile.hwnd   =NULL; 
		lpfile.wFunc=FO_COPY; 
		lpfile.fFlags=FOF_WANTNUKEWARNING;
		lpfile.pFrom=from.c_str(); 
		lpfile.pTo= to.c_str(); 
		lpfile.fAnyOperationsAborted=true; 
		SHFileOperation(&lpfile); 
}

void MainWindow::deleteDir(std::string dir)
{
	SHFILEOPSTRUCT FileOp={0}; 
	FileOp.fFlags = FOF_ALLOWUNDO |  
     FOF_NOCONFIRMATION; 
	FileOp.pFrom = dir.c_str(); 
	 FileOp.pTo = NULL;    
	 FileOp.wFunc = FO_DELETE;  
	 SHFileOperation(&FileOp) ; 

}

bool MainWindow::isPicExsit(std::string path)
{
	std::fstream _file;
	_file.open(path.c_str() ,std::ios::in);
	if(_file.fail())
	{
		return false;	
	};
	return true;
}

void MainWindow::modifyListTXT(std::string appPath ,std::string picDirPath ,std::string relativePath)
{
	std::fstream _file;
	std::string listPath = appPath+"list.txt";
	_file.open(listPath.c_str() ,std::ios::in |std::ios::out);
	if(_file.fail())
	{
		qDebug()<<"list is not exist";	
	};
	qDebug()<<"appPath"<<appPath.c_str()<<"picDirPath"<<picDirPath.c_str()<<"relativePath"<<relativePath.c_str();	
	std::string line , text;
    int p;
	std::string strKey =relativePath+"/";
    std::string strReplace =picDirPath+ "\\";

    while(getline(_file, line))
    {    
        while((p=line.find(strKey.c_str()))!=-1)
        {
            line.replace(p, strKey.length(), strReplace.c_str());
        }
        text+=line+"\n";
    }

    _file.clear();
    _file.sync();
    _file.seekp(0);
    _file<<text;
}

void MainWindow::modifyPicName(std::string from , std::string to)
{
	SHFILEOPSTRUCT FileOp={0}; 
	FileOp.fFlags = FOF_WANTNUKEWARNING;  
	FileOp.pFrom = from.c_str(); 
	FileOp.pTo = to.c_str(); 
	FileOp.wFunc = FO_RENAME; 
	 SHFileOperation(&FileOp) ;
}
//解决无法从const char* 转为LPCWSTR问题
//1)将工程配置属性-》General-》Character Set为多字符集
//且保证C/C++-》Preprocessor-》Preprocessor Definitions中去掉UNICODE/_UNICODE。
//2)若在Unicode字符集下，在所有const char*的变量名前加上(WCHAR *)转换。

//不出现确认对话框 FOF_NOCONFIRMATION      
	//允许放回回收站FOF_ALLOWUNDO 
//需要时直接创建一个文件夹,不需用户确定 FOF_NOCONFIRMMKDIR ; 

//another call app code way
/*
	PROCESS_INFORMATION ProcessInfo; 
	STARTUPINFO StartupInfo; //This is an [in] parameter
	ZeroMemory(&StartupInfo, sizeof(StartupInfo));
	StartupInfo.cb = sizeof StartupInfo ; //Only compulsory field
	if(CreateProcess("C://cygwin//bin//mintty.exe", NULL, 
		 NULL,NULL,FALSE,0,NULL,
		 NULL,&StartupInfo,&ProcessInfo))
	{ 
		 WaitForSingleObject(ProcessInfo.hProcess,INFINITE);
		 CloseHandle(ProcessInfo.hThread);
		 CloseHandle(ProcessInfo.hProcess);
	} 
	else
	{
		 MessageBox(NULL, "The process could not be started", "", MB_OK);
	}
*/