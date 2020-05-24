

CREATE TABLE `t_event_record` (
  `id` varchar(32) NOT NULL COMMENT '事件ID',
  `token_id` varchar(32) DEFAULT '' COMMENT '令牌ID',
  `user_id` varchar(32) DEFAULT '' COMMENT '用户ID',
  `time` datetime DEFAULT NULL COMMENT '事件时间',
  `client_Id` varchar(32) DEFAULT '' COMMENT '客户端ID',
  `name` varchar(50) DEFAULT '' COMMENT '事件名称',
  `code` varchar(50) DEFAULT '' COMMENT '事件Code',
  `type` varchar(20) DEFAULT '' COMMENT '事件类型',
  `level` int(8) DEFAULT '0' COMMENT '事件级别',
  `description` varchar(500) DEFAULT '' COMMENT '事件描述',
  `variables_json` text COMMENT '事件变量的JSON',
  `provider` varchar(80) DEFAULT '' COMMENT '事件的提供者',
  `create_user` varchar(32) DEFAULT 'system' COMMENT '创建者',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` varchar(32) DEFAULT 'system' COMMENT '修改者',
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `alive_flag` tinyint(4) DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_visitor_id` (`token_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_time` (`time`) USING BTREE,
  KEY `idx_client_Id` (`client_Id`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_code` (`code`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE,
  KEY `idx_level` (`level`) USING BTREE,
  KEY `idx_provider` (`provider`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='事件记录表';




CREATE TABLE `t_trace_event_record` (
  `id` varchar(32) NOT NULL COMMENT '事件ID',
  `token_id` varchar(32) DEFAULT '' COMMENT '令牌ID',
  `user_id` varchar(32) DEFAULT '' COMMENT '用户ID',
  `time` datetime DEFAULT NULL COMMENT '事件时间',
  `client_Id` varchar(32) DEFAULT '' COMMENT '客户端ID',
  `level` int(8) DEFAULT '0' COMMENT '事件级别',
  `client_app_id` varchar(50) DEFAULT '' COMMENT '客户端的应用ID',
  `client_name` varchar(50) DEFAULT '' COMMENT '客户端名称',
  `client_user_agent` varchar(500) DEFAULT '' COMMENT '客户端用户代理',
  `client_net_address` varchar(200) DEFAULT '' COMMENT '客户端的网络地址',
  `server_id` varchar(50) DEFAULT '' COMMENT '服务器ID',
  `server_app_id` varchar(50) DEFAULT '' COMMENT '服务器的应用名称',
  `interface_id` varchar(120) DEFAULT '' COMMENT '接口标识',
  `request_referer` varchar(200) DEFAULT '' COMMENT '请求的来源',
  `request_method` varchar(20) DEFAULT '' COMMENT '请求的方法',
  `request_address` varchar(200) DEFAULT '' COMMENT '请求的地址',
  `request_input` text COMMENT '请求时的输入信息',
  `response_output` text COMMENT '响应时的输出信息',
  `error_message` text COMMENT '错误信息',
  `process_time` int(11) DEFAULT '-1' COMMENT '处理时间',
  `create_user` varchar(32) DEFAULT 'system' COMMENT '创建者',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` varchar(32) DEFAULT 'system' COMMENT '修改者',
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `alive_flag` tinyint(4) DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_visitor_id` (`token_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_time` (`time`) USING BTREE,
  KEY `idx_client_Id` (`client_Id`) USING BTREE,
  KEY `idx_level` (`level`) USING BTREE,
  KEY `idx_client_app_id` (`client_app_id`) USING BTREE,
  KEY `idx_client_user_agent` (`client_user_agent`) USING BTREE,
  KEY `idx_client_net_address` (`client_net_address`) USING BTREE,
  KEY `idx_server_id` (`server_id`) USING BTREE,
  KEY `idx_server_app_id` (`server_app_id`) USING BTREE,
  KEY `idx_request_path` (`interface_id`) USING BTREE,
  KEY `idx_process_time` (`process_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='跟踪事件记录表';




CREATE TABLE `t_device_record` (
  `id` varchar(60) NOT NULL COMMENT 'ID',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `type` varchar(30) DEFAULT '' COMMENT '类型',
  `brand_name` varchar(50) DEFAULT '' COMMENT '名称',
  `model` varchar(50) NOT NULL COMMENT '型号',
  `code_name` varchar(50) DEFAULT '' COMMENT '名称',
  `display_name` varchar(60) DEFAULT '' COMMENT '名称',
  `manufacturer` varchar(80) DEFAULT '' COMMENT '厂商',
  `description` varchar(200) DEFAULT '' COMMENT '描述',
  `udid` varchar(60) DEFAULT '' COMMENT 'UDID',
  `idfa` varchar(60) DEFAULT '' COMMENT 'IDFA',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `create_user` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(32) NOT NULL COMMENT '修改者',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  `alive_flag` tinyint(4) DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备表';





CREATE TABLE `t_client_record` (
  `id` int(13) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `device_id` varchar(60) NOT NULL COMMENT '设备',
  `app_id` varchar(40) NOT NULL COMMENT '应用',
  `app_name` varchar(50) DEFAULT '' COMMENT '名称',
  `app_type` varchar(20) DEFAULT '' COMMENT '类型',
  `app_version` varchar(40) DEFAULT '' COMMENT '版本',
  `system_name` varchar(50) NOT NULL COMMENT '系统名称',
  `system_version` varchar(30) DEFAULT '' COMMENT '系统版本',
  `system_bits` varchar(10) DEFAULT '' COMMENT '系统位数',
  `user_id` varchar(40) DEFAULT '' COMMENT '用户ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户名称',
  `description` varchar(200) DEFAULT '' COMMENT '描述',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `create_user` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(32) NOT NULL COMMENT '修改者',
  `update_date` datetime NOT NULL COMMENT '修改时间',
  `alive_flag` tinyint(4) DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端表';














