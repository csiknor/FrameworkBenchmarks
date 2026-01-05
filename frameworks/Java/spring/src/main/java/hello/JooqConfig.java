package hello;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.data.jdbc.autoconfigure.DataJdbcRepositoriesAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Profile("jooq")
@Configuration
@EnableAutoConfiguration(exclude = { DataJdbcRepositoriesAutoConfiguration.class })
public class JooqConfig {

}
