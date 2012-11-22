
// VRML
#pragma warning( disable : 4250 ) 
#pragma comment(lib, "Ws2_32.lib")
#pragma comment(lib, "antlrd.lib")
#pragma comment(lib, "regexd.lib")
#pragma comment(lib, "openvrmld.lib")

#include "PreDefs.h"
#include "BuildingData.h"
#include "GeomElements.h"
#include <osgUtil/Optimizer>
#include <sstream>


CBuildingData::CBuildingData(void)
{
	m_3DBuildingVrts = new osg::Vec3Array;
	m_3DBuildingClrs = new osg::Vec3Array;
	m_3DBuildingNrts = new osg::Vec3Array;
}

CBuildingData::~CBuildingData(void)
{
}

// load 3d data from vrml file
int CBuildingData::load_3d_data(std::string& fn)
{
	if (fn.empty())
		return 0;

	m_3DBuildingVrts->clear();
	m_3DBuildingClrs->clear();
	m_3DBuildingNrts->clear();
/*	
	osgDB::Registry::instance()->addFileExtensionAlias("wrl", "vrml");
	osg::ref_ptr<osg::Node> loadedModel = osgDB::readNodeFile(fn.c_str());
	VertexVisitor vtea;
	loadedModel->accept(vtea);
*/

	std::fstream _file;		
	_file.open(fn.c_str() ,std::ios::in );
	if(_file.fail())
	{	
		return 0;
	};	

	std::string line ;
	boolean flag = false;
	m_3DBuildingVrts->clear();
	m_3DBuildingClrs->clear();
	m_3DBuildingNrts->clear();

	while(getline(_file, line,'\n'))
	{    
		if(line=="end_header")
		{
			flag = true;
			continue;
		}			
		if(!flag)
			continue;
		std::stringstream temp(line);
		std::string node;
		std::string vtea[9];
		int i=0;
		while(getline(temp , node ,' '))
		{
			vtea[i] = node;
			i++;			
		}
		m_3DBuildingVrts->push_back(osg::Vec3(atof(vtea[0].c_str()), atof(vtea[1].c_str()), atof(vtea[2].c_str())));
		m_3DBuildingClrs->push_back(osg::Vec3(atof(vtea[6].c_str())/255.0, atof(vtea[7].c_str())/255.0, atof(vtea[8].c_str())/255.0));
		m_3DBuildingNrts->push_back(osg::Vec3(atof(vtea[3].c_str()), atof(vtea[4].c_str()), atof(vtea[5].c_str())));
		
	}
	vrtnum = m_3DBuildingVrts->size();
	/*
	int vrtnum = (vtea.extracted_vrts)->size();
	for (int iV=0; iV<vrtnum; iV++)
	{
		m_3DBuildingVrts->push_back(vtea.extracted_vrts->at(iV));
		m_3DBuildingClrs->push_back(vtea.extracted_vrtclrs->at(iV));
	}
	std::cout << "Load 3D building point data number : " << vrtnum << std::endl;
*/
	return 0;
}