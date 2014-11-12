require 'rubygems'
require 'sinatra'
require 'json'

use Rack::Session::Pool

# courtesy chucknorrisfacts.com
CHUCK_NORRIS_QUOTES = [
  "Chuck Norris and Superman once fought each other on a bet. The loser had to start wearing his underwear on the outside of his pants",
  "Chuck Norris counted to infinity - twice.",
  "Chuck Norris can slam a revolving door.",
  "Chuck Norris doesn't read books. He stares them down until he gets the information he wants.",
  "There is no theory of evolution. Just a list of creatures Chuck Norris has allowed to live.",
  "When Chuck Norris does a pushup, he isn't lifting himself up, he's pushing the Earth down.",
  "Chuck Norris' hand is the only hand that can beat a Royal Flush.",
  "Chuck Norris doesn't wear a watch. HE decides what time it is.",
  "Chuck Norris can kill two stones with one bird",
  "Chuck Norris can punch a cyclops between the eyes.",
  "Chuck Norris doesn't call the wrong number. You answer the wrong phone.",
  "When Chuck Norris fights in a boxing match, the referee doesn't count 10 to 1, he checks for vital signs of life.",
  "Chuck Norris saw 'The Ring' video, then watched it again the week later",
  "Why is Beavis' friend's name Butthead? Well let's just say Chuck Norris was involved.",
  "Chuck Norris Can Roundhouse kick an atom and eat a galaxy at the same time",
  "When Chuck Norris walks he dosn't move the earth rotates",
  "Every rainbow Chuck Norris sees is a double rainbow.",
  "Chuck Norris is the reason why the Myans stopped working on their callender!",
  "Beware of dogs... Dogs, beware of Chuck Norris.",
  "Chuck Norris can can change the font of a picture",
  "Chuck Norris let 'facts' about him circulate... They make his enemies underestimate his true power.",
  "Chuck Norris does not visit websites, websites visit Chuck Norris.",
  "There's only one thing greater than a high priest vatican assasin warlock and that's Chuck Norris",
  "Chuck Norris is allowed to feed the bears",
  "There are 3 sides to the force, Light, Dark and Chuck Norris",
  "If you can see Chuck Norris, you're in trouble. If you suddenly can't, you're dead.",
  "Chuck Norris' roundhouse kick can kill 10 billion people. Theres only 6.8 billion people on earth",
  "Chuck Norris had a knife thrown at him... the knife didn't impale him, he impaled the knife",
  "The largest unit of digital information is called Chuckbyte.",
  "Chuck Norris' lunch was stolen during a camping trip. No one has seen Big Foot ever since.",
  "Chuck Norris once ran around the world in 10 minutes he spent 9 of those minutes stretching",
  "Chuck Norris bought property in Death Valley just because he likes the name",
  "Chuck Norris history month is all year",
  "Chuck Norris can drive while kicking"
]
QUOTES_PER_PAGE = 14

get '/endpoint.json' do
  page      = request.env['rack.request.query_hash']['page'].to_i 
  page      = 1 if page.nil? or page.zero?
  offset    = (page - 1) * QUOTES_PER_PAGE
  quotes    = CHUCK_NORRIS_QUOTES.slice(offset, QUOTES_PER_PAGE)
  next_page = (page + 1) if CHUCK_NORRIS_QUOTES.length > page * QUOTES_PER_PAGE

  content_type :json
  {
    chuck_norris_quotes: quotes,
    next_page: next_page
  }.to_json
end
