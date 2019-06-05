context('Affect Grid')

## JSON data
participants = data.frame(token = c('06eaaeeb-fab1-4c7f-a00f-3e66f063adcb','0117a606-a57c-40a2-87fe-258afa6f007c'))

data_dir <- '../fixtures/1'
path <- paste0(data_dir,'/',participants[1,1],'_finished/affect-grid-1-results.json')
test_that("affect_grid() can process a JSON file", {
  expect_silent(affect_grid(path, p=1))
})

df <- affect_grid(path, p=1)
test_that('Affect Grid arousal score is correct', {
  expect_equal(df[1,'arousal'], 2)
})
test_that('Affect Grid pleasure score is correct', {
  expect_equal(df[1,'pleasure'], 2)
})

path <- paste0(data_dir,'/',participants[1,1],'_finished/affect-grid-2-results.json')
df <- affect_grid(path, p=2)
test_that('Affect Grid arousal score is correct', {
  expect_equal(df[1,'arousal'], 0)
})
test_that('Affect Grid pleasure score is correct', {
  expect_equal(df[1,'pleasure'], -1)
})

# top left square == 0
path <- paste0(data_dir,'/',participants[1,1],'_finished/affect-grid-3-results.json')
df <- affect_grid(path, p=3)
test_that('Affect Grid arousal score is correct', {
  expect_equal(df[1,'arousal'], 4)
})
test_that('Affect Grid pleasure score is correct', {
  expect_equal(df[1,'pleasure'], -4)
})

# bottom left square == 72
path <- paste0(data_dir,'/',participants[1,1],'_finished/affect-grid-4-results.json')
df <- affect_grid(path, p=4)
test_that('Affect Grid arousal score is correct', {
  expect_equal(df[1,'arousal'], -4)
})
test_that('Affect Grid pleasure score is correct', {
  expect_equal(df[1,'pleasure'], -4)
})