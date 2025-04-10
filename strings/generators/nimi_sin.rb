require 'securerandom'

=begin
  Todo: Don't pick n or m after n
=end

KEN_PI_OPEN = [
  'V',
  'V',
  'CV',
  'CV',
  'CVn',
]
KEN_PI_INSA = [
  'CV',
  'CV',
  'CV',
  'CVn',
]
KEN_PI_PINI = [
  'CV',
  'Ci',
  'CVn',
]
KALAMA = [
  'a',
  'e',
  'i',
  'o',
  'u',
]
KALAMA_ALA = [
  'k',
  'l',
  'm',
  'n',
  'p',
  's',
  'w',
]
KULUPU_KALAMA = [
  'ja',
  'je',
  'jo',
  'ju',
  'ka',
  'ke',
  'ki',
  'ko',
  'ku',
  'la',
  'le',
  'li',
  'lo',
  'lu',
  'ma',
  'me',
  'mi',
  'mo',
  'mu',
  'na',
  'ne',
  'ni',
  'no',
  'nu',
  'pa',
  'pe',
  'pi',
  'po',
  'pu',
  'sa',
  'se',
  'si',
  'so',
  'su',
  'ta',
  'te',
  'to',
  'tu',
  'wa',
  'we',
  'wi',
]

nanpa_pi_kulupu_kalama = rand(2..4)
nimi_sin = []

nimi_sin.push case KEN_PI_OPEN.sample(random: SecureRandom)
when 'V'
  KALAMA.sample(random: SecureRandom)
when 'CV'
  KULUPU_KALAMA.sample(random: SecureRandom)
when 'CVn'
  KULUPU_KALAMA.sample(random: SecureRandom) + 'n'
end
nanpa_pi_kulupu_kalama -= 1

nanpa_pi_kulupu_kalama.times do |nanpa|
  nimi_sin.push case nanpa
  when 1
    case KEN_PI_PINI.sample(random: SecureRandom)
    when 'CV'
      KULUPU_KALAMA.sample(random: SecureRandom)
    when 'Ci'
      KALAMA_ALA.sample(random: SecureRandom) + 'i'
    when 'CVn'
      KULUPU_KALAMA.sample(random: SecureRandom) + 'n'
    end
  else
    case KEN_PI_INSA.sample(random: SecureRandom)
    when 'CV'
      KULUPU_KALAMA.sample(random: SecureRandom)
    when 'CVn'
      KULUPU_KALAMA.sample(random: SecureRandom) + 'n'
    end
  end
end

puts nimi_sin.join
