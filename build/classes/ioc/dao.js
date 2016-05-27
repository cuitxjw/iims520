var ioc = {
		dataSource :{
			type : "com.alibaba.druid.pool.DruidDataSource",
			events : {
				depose : "close"
			},
			fields : {
				driverClassName : "com.mysql.jdbc.Driver",
				url             : "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8",
				username        : 'test',
				password        : 'test',
				initialSize     : 10,
				maxActive       : 100,
				minIdle         : 10,
				maxIdle         : 20,
				defaultAutoCommit: false,
				validationQuery : "select 1"
			}
		},
		dao : {
			type : "org.nutz.dao.impl.NutDao",
			fields : {
				dataSource : {
					refer : "dataSource"
				} 
			}
		}
}