package demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;

@Configuration
@Order(1)
public class ResourceServer {
	@Configuration
	@EnableAuthorizationServer
	public static class OAuth2LoginSecurityConfig extends WebSecurityConfigurerAdapter {
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http.authorizeRequests().antMatchers("/login**","/oauth2**","/error**").permitAll().anyRequest().authenticated().and()
					.oauth2Login();

		}
	}

}