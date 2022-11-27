babynames
view(babynames)
babyname_gre_2010 <- filter(babynames, year > 2010)
babyname_less_2010 <- filter(babynames, year < 2011)
View(distinct(babyname_less_2010['name']) )
unique_names_less2010 <- (distinct(babyname_less_2010['name']) )
view(unique_names_less2010)
final_data <- filter(babyname_gre_2010, !name %in% unlist(unique_names_less2010['name']))
view(final_data)
count(final_data, name = "Magaby")
ggplot(data = final_data) + geom_boxplot(mapping = aes(x = n, y = year))
ggplot(data = final_data) + geom_boxplot(mapping = aes(x = name , y = n))
ggplot(final_data, aes(x = name)) + geom_bar()
df <- data.frame(table(final_data$name))
view(df)
ggplot(df, aes(x = Var1)) + geom_bar()
sample <- as.factor(final_data$name)
view(sample)
factor(final_data$name)
count(final_data, 'name')
freq_table <- table(final_data$name)
name_freq <- final_data %>% select(name, n)
name_fr <- name_freq %>% 
  group_by(name) %>%
  summarise(
    MaxNbyName = max(n, na.rm = T), 
    MinNbyName = min(n, na.rm = T)
  ) %>%
  arrange(name)
view(name_fr)
ggplot(name_fr, aes(x = name)) + geom_boxplot(mapping = aes(x = name, y = MinNbyName))
