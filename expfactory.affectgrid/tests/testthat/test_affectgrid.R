context('Affect Grid')

## JSON data
participants = data.frame(token = c('06eaaeeb-fab1-4c7f-a00f-3e66f063adcb','0117a606-a57c-40a2-87fe-258afa6f007c'))

fixture_dir <- '../fixtures/1'
path <- paste0(fixture_dir,'/',participants[1,1],'_finished/affect-grid-1-results.json')
test_that("affect_grid() can process a JSON file", {
  expect_silent(affect_grid(path, p=1))
})

# ag_df <- expand.grid(token = participants$token, time = 1:3) %>%
#   mutate(path=paste(data_dir, token, '_finished', sep='')) %>%
#   mutate(path = ifelse(time == 1, paste(path, 'affect-grid-1-results.json', sep='/'),
#                        ifelse(time == 2, paste(path, 'affect-grid-2-results.json', sep='/'),
#                               paste(path, 'affect-grid-3-results.json', sep='/'))))
# 
# ag_df <- ag_df %>%
#   group_by(token, time) %>%
#   do(., expfactory::process_expfactory_experiment(.$path)) %>%
#   ungroup %>%
#   left_join(participants, by='token') %>%
#   filter(test_part == "response") %>%
#   select(p, button_pressed)

