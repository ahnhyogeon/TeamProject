package com.pk.dto;

import java.sql.Timestamp;
import org.springframework.stereotype.Repository;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Repository
@Data
@JsonInclude(JsonInclude.Include.NON_NULL) // null 필드를 JSON에서 제외
public class MenuDto {
	
    @JsonProperty("id")
    private int id;

    @JsonProperty("business")
    private int business;

    @JsonProperty("m_name")
    private String m_name;

    @JsonProperty("m_cost")
    private String m_cost;

    @JsonProperty("m_intro")
    private String m_intro;

    @JsonProperty("m_code")
    private String m_code;

    @JsonProperty("imnum")
    private String imnum;

    @JsonProperty("wdate")
    private Timestamp wdate;

    @JsonProperty("visible")
    private int visible;

    @JsonProperty("thumbnail")
    private String thumbnail;
    
    public MenuDto() {
    }
}