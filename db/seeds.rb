characters = Character.create([
  { value: '你', pinyin: 'nǐ', english_translation: 'you' },
  { value: '好', pinyin: 'hǎo', english_translation: 'good' },
  { value: '我', pinyin: 'wǒ', english_translation: 'i' },
  { value: '是', pinyin: 'shì', english_translation: 'are' },
  { value: '吗', pinyin: 'ma', english_translation: 'question particle' }
])

phrases = Phrase.create([
  { value: '你好', pinyin: 'nǐ hǎo', english_translation: 'hello', characters: [Character.find_by_value('你'), Character.find_by_value('好')] },
  { value: '你好吗', pinyin: 'nǐ hǎo ma', english_translation: 'how are you?', characters: [Character.find_by_value('你'), Character.find_by_value('好'), Character.find_by_value('吗')] },
  { value: '我是', pinyin: 'wǒ shì', english_translation: 'i am', characters: [Character.find_by_value('我'), Character.find_by_value('是')] }
])
