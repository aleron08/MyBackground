package com.ilearning.test;


import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

public class MBGTest {

	/**
	 * 通过Mybtis生成JavaBean
	 * @throws IOException
	 * @throws XMLParserException
	 * @throws InvalidConfigurationException
	 * @throws SQLException
	 * @throws InterruptedException
	 */
	@Test
	public void mbgTest() throws IOException, XMLParserException, InvalidConfigurationException, SQLException, InterruptedException {
		List<String> warnings = new ArrayList<String>();
		   boolean overwrite = true;
		   File configFile = new File("mbg.xml");
		   ConfigurationParser cp = new ConfigurationParser(warnings);
		   Configuration config = cp.parseConfiguration(configFile);
		   DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		   MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		   myBatisGenerator.generate(null);
	}

}
