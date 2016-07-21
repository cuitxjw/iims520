var ioc = {
		conf : {
			type : "org.nutz.ioc.impl.PropertiesProxy",
			fields : {
				paths : ["custom/db.properties"]
			}
		},
		dataSource :{
			type : "com.alibaba.druid.pool.DruidDataSource",
			events : {
				depose : "close"
			},
			fields : {
				driverClassName : {java:"$conf.get('db.driverClassName')"},
				url             : {java:"$conf.get('db.url')"},
				username        : {java:"$conf.get('db.username')"},
				password        : {java:"$conf.get('db.password')"},
				initialSize     : {java:"$conf.get('db.initialSize')"},
				maxActive       : {java:"$conf.get('db.maxActive')"},
				minIdle         : {java:"$conf.get('db.minIdle')"},
				maxIdle         : {java:"$conf.get('db.maxIdle')"},
				defaultAutoCommit: {java:"$conf.get('db.defaultAutoCommit')"},
				validationQuery : {java:"$conf.get('db.validationQuery')"}
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