const rSplash = "/splash";
const rLanding = "/landing";
const rLoginScreen = "/login";
const rRegisterScreen = "/signup";
const rUserListScreen = "/userList";
const rInti = "/";
const rProfileScreen = "/profile";
const rAcountInformation = "/accountInformation";
const rAcountPassword = "/accountPassword";
const rNotifications = "/notifications";
const rLanguages = "/Languages";
const rAddress = "/Address";
const rPayment = "/Payment";
const rHome = "/home";
const rSearch = "/Search";
const rCoin = "/Coin";
const rOrderbook = "/Orderbook";
const rTrade = "/trade";
const rWallet = "/wallet";
const rBacktest = "/backtest";
const rBacktestResults = "/backtest_results";
const rSmartTrade = "/smart_trade";
const rAlert = "/alerts";
const rSubscriptions = "/subscription";
const rDashboard = "/dashboard";
const rSmartTradeAdmin = "/smartTradeAdmin";
const rSystemWallet = "/systemWallet";
const rUserView = "/userView";

// ignore: constant_identifier_names
const exchange_pairs = [
  'ZILUSDT',
  'BTCUSDT',
  'HNTUSDT',
  'ETHUSDT',
  'BNBUSDT',
  'NEOUSDT',
  'LTCUSDT',
  'QTUMUSDT',
  'ADAUSDT',
  'XRPUSDT',
  'EOSUSDT',
  'IOTAUSDT',
  'XLMUSDT',
  'ONTUSDT',
  'TRXUSDT',
  'ETCUSDT',
  'ICXUSDT',
  'NULSUSDT',
  'VETUSDT',
  'LINKUSDT',
  'WAVESUSDT',
  'BTTUSDT',
  'ONGUSDT',
  'HOTUSDT',
  'ZRXUSDT',
  'FETUSDT',
  'BATUSDT',
  'ZECUSDT',
  'IOSTUSDT',
  'CELRUSDT',
  'DASHUSDT',
  'NANOUSDT',
  'OMGUSDT',
  'THETAUSDT',
  'ENJUSDT',
  'MITHUSDT',
  'MATICUSDT',
  'ATOMUSDT',
  'TFUELUSDT',
  'ONEUSDT',
  'FTMUSDT',
  'ALGOUSDT',
  'USDSBUSDT',
  'GTOUSDT',
  'ERDUSDT',
  'DOGEUSDT',
  'DUSKUSDT',
  'ANKRUSDT',
  'WINUSDT',
  'COSUSDT',
  'NPXSUSDT',
  'COCOSUSDT',
  'MTLUSDT',
  'TOMOUSDT',
  'PERLUSDT',
  'DENTUSDT',
  'MFTUSDT',
  'KEYUSDT',
  'STORMUSDT',
  'DOCKUSDT',
  'WANUSDT',
  'FUNUSDT',
  'CVCUSDT',
  'CHZUSDT',
  'BANDUSDT',
  'BEAMUSDT',
  'XTZUSDT',
  'RENUSDT',
  'RVNUSDT',
  'HCUSDT',
  'HBARUSDT',
  'NKNUSDT',
  'STXUSDT',
  'KAVAUSDT',
  'ARPAUSDT',
  'IOTXUSDT',
  'RLCUSDT',
  'MCOUSDT',
  'CTXCUSDT',
  'BCHUSDT',
  'TROYUSDT',
  'VITEUSDT',
  'FTTUSDT',
  'OGNUSDT',
  'DREPUSDT',
  'BULLUSDT',
  'BEARUSDT',
  'ETHBULLUSDT',
  'ETHBEARUSDT',
  'TCTUSDT',
  'WRXUSDT',
  'BTSUSDT',
  'LSKUSDT',
  'BNTUSDT',
  'LTOUSDT',
  'EOSBULLUSDT',
  'EOSBEARUSDT',
  'XRPBULLUSDT',
  'XRPBEARUSDT',
  'STRATUSDT',
  'AIONUSDT',
  'MBLUSDT',
  'COTIUSDT',
  'BNBBULLUSDT',
  'BNBBEARUSDT',
  'STPTUSDT',
  'WTCUSDT',
  'DATAUSDT',
  'XZCUSDT',
  'SOLUSDT',
  'CTSIUSDT',
  'HIVEUSDT',
  'CHRUSDT',
  'GXSUSDT',
  'ARDRUSDT',
  'LENDUSDT',
  'MDTUSDT',
  'STMXUSDT',
  'KNCUSDT',
  'REPUSDT',
  'LRCUSDT',
  'PNTUSDT',
  'COMPUSDT',
  'BKRWUSDT',
  'SCUSDT',
  'ZENUSDT',
  'SNXUSDT',
  'VTHOUSDT',
  'DGBUSDT',
  'SXPUSDT',
  'MKRUSDT',
  'DAIUSDT',
  'DCRUSDT',
  'STORJUSDT',
  'MANAUSDT',
  'YFIUSDT',
  'BALUSDT',
  'BLZUSDT',
  'IRISUSDT',
  'KMDUSDT',
  'JSTUSDT',
  'SRMUSDT',
  'ANTUSDT',
  'CRVUSDT',
  'SANDUSDT',
  'OCEANUSDT',
  'NMRUSDT',
  'DOTUSDT',
  'LUNAUSDT',
  'RSRUSDT',
  'WNXMUSDT',
  'TRBUSDT',
  'BZRXUSDT',
  'SUSHIUSDT',
  'YFIIUSDT',
  'KSMUSDT',
  'EGLDUSDT',
  'DIAUSDT',
  'RUNEUSDT',
  'FIOUSDT',
  'UMAUSDT',
  'BELUSDT',
  'WINGUSDT',
  'UNIUSDT',
  'NBSUSDT',
  'OXTUSDT',
  'SUNUSDT',
  'AVAXUSDT',
  'HNTUSDT',
  'FLMUSDT',
  'ORNUSDT',
  'UTKUSDT',
  'XVSUSDT',
  'ALPHAUSDT',
  'AAVEUSDT',
  'NEARUSDT',
  'FILUSDT',
  'INJUSDT',
  'AUDIOUSDT',
  'CTKUSDT',
  'AKROUSDT',
  'AXSUSDT',
  'HARDUSDT',
  'DNTUSDT',
  'STRAXUSDT',
  'UNFIUSDT',
  'ROSEUSDT',
  'AVAUSDT',
  'XEMUSDT',
  'SKLUSDT',
  'GRTUSDT',
  'JUVUSDT',
  'PSGUSDT',
  '1INCHUSDT',
  'REEFUSDT',
  'OGUSDT',
  'ATMUSDT',
  'ASRUSDT',
  'CELOUSDT',
  'RIFUSDT',
  'BTCSTUSDT',
  'TRUUSDT',
  'CKBUSDT',
  'TWTUSDT',
  'FIROUSDT',
  'LITUSDT',
  'SFPUSDT',
  'DODOUSDT',
  'CAKEUSDT',
  'ACMUSDT',
  'BADGERUSDT',
  'FISUSDT',
  'OMUSDT',
  'PONDUSDT',
  'DEGOUSDT',
  'ALICEUSDT',
  'LINAUSDT',
  'PERPUSDT',
  'RAMPUSDT',
  'CFXUSDT',
  'EPSUSDT',
  'AUTOUSDT',
  'TKOUSDT',
  'PUNDIXUSDT',
  'TLMUSDT',
  'BTGUSDT',
  'MIRUSDT',
  'BARUSDT',
  'FORTHUSDT',
  'BAKEUSDT',
  'BURGERUSDT',
  'SLPUSDT',
  'ICPUSDT',
  'ARUSDT',
  'POLSUSDT',
  'MDXUSDT',
  'MASKUSDT',
  'NUUSDT',
  'XVGUSDT',
  'ATAUSDT',
  'GTCUSDT',
  'TORNUSDT',
  'KEEPUSDT',
  'ERNUSDT',
  'KLAYUSDT',
  'PHAUSDT',
  'BONDUSDT',
  'MLNUSDT',
  'DEXEUSDT',
  'C98USDT',
  'CLVUSDT',
  'QNTUSDT',
  'FLOWUSDT',
  'TVKUSDT',
  'MINAUSDT',
  'RAYUSDT',
  'FARMUSDT',
  'ALPACAUSDT',
  'QUICKUSDT',
  'MBOXUSDT',
  'FORUSDT',
  'REQUSDT',
  'GHSTUSDT',
  'WAXPUSDT',
  'TRIBEUSDT',
  'GNOUSDT',
  'XECUSDT',
  'ELFUSDT',
  'DYDXUSDT',
  'POLYUSDT',
  'IDEXUSDT',
  'VIDTUSDT',
  'GALAUSDT',
  'ILVUSDT',
  'YGGUSDT',
  'SYSUSDT',
  'DFUSDT',
  'FIDAUSDT',
  'FRONTUSDT',
  'CVPUSDT',
  'AGLDUSDT',
  'RADUSDT',
  'BETAUSDT',
  'RAREUSDT',
  'LAZIOUSDT',
  'CHESSUSDT',
  'ADXUSDT',
  'AUCTIONUSDT',
  'DARUSDT',
  'BNXUSDT',
  'RGTUSDT',
  'MOVRUSDT',
  'CITYUSDT',
  'ENSUSDT',
  'KP3RUSDT',
  'QIUSDT',
  'PORTOUSDT',
  'POWRUSDT',
  'JASMYUSDT',
  'AMPUSDT',
  'PLAUSDT',
  'PYRUSDT',
  'RNDRUSDT',
  'ALCXUSDT',
];
