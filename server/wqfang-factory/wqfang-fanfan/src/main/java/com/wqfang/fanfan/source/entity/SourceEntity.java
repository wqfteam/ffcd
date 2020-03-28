package com.wqfang.fanfan.source.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 文件资源表
 * 
 * @author undwin
 * @email love@und.win
 * @date 2020-03-24 00:00:22
 */
@Data
@TableName("fanfan_source")
public class SourceEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;
	/**
	 * 资源名称
	 */
	private String sourceName;
	/**
	 * 资源路径
	 */
	private String sourcePath;
	/**
	 * 资源上传文件名
	 */
	private String sourceNameUpload;
	/**
	 * 资源大小
	 */
	private Double sourceSize;
	/**
	 * 资源类型
	 */
	private String sourceFileType;
	/**
	 * 资源下载次数
	 */
	private String sourceDownloadCount;
	/**
	 * 资源点赞次数
	 */
	private String sourceCountLike;
	/**
	 * 来源计数访问
	 */
	private String sourceCountVisit;
	/**
	 * 资源排序
	 */
	private String sourceSort;
	/**
	 * 资源来源
	 */
	private String sourceSource;
	/**
	 * 资源后缀
	 */
	private String sourceSuffixt;
	/**
	 * 来源类类型
	 */
	private String sourceType;
	/**
	 * 创建时间
	 */
	private Date sourceCreateTime;
	/**
	 * 修改时间
	 */
	private BigDecimal sourceModifyTime;
	/**
	 * 扩展表类型
	 */
	private String extendTableType;

}
