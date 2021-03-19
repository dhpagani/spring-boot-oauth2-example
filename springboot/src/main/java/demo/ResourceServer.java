package demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

public class ResourceServer {
	  private int a, b;
	@Configuration
	@EnableResourceServer
	public static class OAuth2LoginSecurityConfig extends WebSecurityConfigurerAdapter {
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			
			http.authorizeRequests().anyRequest().authenticated();

int c; int d;
			System.out.println("xablau");
		}
	}

}