package cn.barathrum.frogshop.config;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.introspect.JacksonAnnotationIntrospector;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages={"cn.barathrum.frogshop.*.**"})
public class WebConfig extends WebMvcConfigurerAdapter{

	/*@Bean
	@Order(2)
	public ViewResolver viewResolver(){
		
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/view/");
		
		resolver.setSuffix(".jsp");
		//resolver.setExposeContextBeansAsAttributes(true);
		return resolver;
	}
	*/
	@Bean
	//@Order(0)
	public ViewResolver homeViewResolver(){
		
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/home/");
		resolver.setOrder(0);
		resolver.setSuffix(".jsp");
		//resolver.setExposeContextBeansAsAttributes(true);
		return resolver;
	}
	
	@Bean
//	@Order(1)
	public ViewResolver personViewResolver(){
		
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/person/");
		resolver.setOrder(1);
		resolver.setSuffix(".jsp");
		//resolver.setExposeContextBeansAsAttributes(true);
		return resolver;
	}
	
/*	
	@Bean
	public MultipartResolver multipartResolver() throws IOException{
		CommonsMultipartResolver cmr = new CommonsMultipartResolver();
		cmr.setUploadTempDir(new FileSystemResource("/tmp/file"));
		cmr.setMaxUploadSize(1048576);
		cmr.setMaxInMemorySize(0);
		return cmr;
	}
	*/
	@Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(mappingJacksonHttpMessageConverter());
        super.configureMessageConverters(converters);
    }
	
    @Bean
    public JacksonAnnotationIntrospector jacksonAnnotationIntrospector() {
        return new JacksonAnnotationIntrospector();
    }
    
    @Bean
    public ObjectMapper objectMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.setAnnotationIntrospector(jacksonAnnotationIntrospector());
        return mapper;
    }

    @Bean
    public RequestMappingHandlerAdapter requestMappingHandlerAdapter(){
    	RequestMappingHandlerAdapter amga = new RequestMappingHandlerAdapter();
    	List<HttpMessageConverter<?>> ls = new ArrayList<HttpMessageConverter<?>>();
    	ls.add(mappingJacksonHttpMessageConverter());
    	amga.setMessageConverters(ls);
    	return amga;
    }
    
    @Bean
    public MappingJackson2HttpMessageConverter mappingJacksonHttpMessageConverter() {
        MappingJackson2HttpMessageConverter messageConverter = new MappingJackson2HttpMessageConverter();
        messageConverter.setObjectMapper(objectMapper());
        return messageConverter;
    }
	
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		// TODO Auto-generated method stub
		configurer.enable();
	}
 
	@Autowired
	DefaultWebSecurityManager securityManager;
	
	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(){
		AuthorizationAttributeSourceAdvisor aasa = new AuthorizationAttributeSourceAdvisor();
		
		aasa.setSecurityManager(securityManager);
		
		return aasa;
	}
	
	//静态资源管理
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//registry.addResourceHandler("").addResourceLocations("");
		registry.addResourceHandler("/AmazeUI-2.4.2/**").addResourceLocations("/AmazeUI-2.4.2/");
		registry.addResourceHandler("/basic/**").addResourceLocations("/basic/");
		registry.addResourceHandler("/css/**").addResourceLocations("/css/");
		registry.addResourceHandler("/goodImage/**").addResourceLocations("/goodImage/");
		//registry.addResourceHandler("/goodImage/goodDetail/**").addResourceLocations("/goodImage/goodDetail/**");
		registry.addResourceHandler("/js/**").addResourceLocations("/js/");
		
		//super.addResourceHandlers(registry);
	}
}
