# frozen_string_literal: true

# This solution is way too slow:
# def fibonacci(nth)
#   return 1 if nth <= 2

#   fibonacci(nth - 1) + fibonacci(nth - 2)
# end

def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

# This solution is easier to understand and just as fast as tail recursion.
# However, there are some problems where a recursive solution is easier to
# understand, faster, or necessary.
def fibonacci_iteration(nth)
  return 0 if nth.zero?
  return 1 if nth < 3

  numbers = [0, 1]
  nth_number = nil
  (2..nth).each do
    nth_number = numbers[0] + numbers[1]
    numbers[0] = numbers[1]
    numbers[1] = nth_number
  end

  nth_number
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(19) == 4181
p fibonacci(20) == 6765
p fibonacci(50) == 12_586_269_025
# rubocop:disable Layout/LineLength
p fibonacci(9300) == 172_016_189_374_147_053_149_245_733_607_843_627_033_712_998_328_613_748_189_993_701_825_722_804_070_768_516_415_168_181_208_246_638_301_391_608_236_809_840_529_151_080_590_312_408_683_645_532_773_281_030_289_634_576_849_789_413_445_950_938_242_755_175_076_868_779_298_099_606_125_023_871_825_720_808_104_844_407_965_188_315_524_615_803_250_220_617_160_534_766_560_905_717_607_572_468_112_501_263_805_602_481_309_788_730_101_962_923_229_667_846_370_011_371_765_545_589_347_932_509_206_913_812_588_061_036_487_737_866_721_235_837_267_124_142_512_052_915_579_940_565_067_239_484_698_832_027_483_738_259_175_077_563_032_962_185_672_388_190_263_884_583_714_231_929_990_998_317_632_311_246_729_601_435_207_220_619_165_611_706_396_445_460_649_866_688_255_249_061_778_839_918_160_932_809_859_233_476_967_795_584_517_164_429_222_943_965_668_523_189_751_804_478_240_286_609_078_240_970_828_195_067_405_328_760_079_790_876_323_075_295_917_255_269_278_733_984_296_040_975_850_645_214_682_829_036_825_971_809_183_628_806_413_895_520_901_561_102_465_414_859_868_983_710_745_295_778_239_055_338_105_476_715_572_956_343_012_331_391_851_188_909_099_634_171_109_192_622_407_407_957_864_459_689_634_269_576_882_970_823_711_773_120_094_436_534_323_196_676_366_506_071_979_592_529_165_765_382_419_106_066_988_854_601_558_023_368_404_543_499_631_847_899_384_298_775_932_222_816_633_970_661_087_708_538_005_859_111_638_764_478_053_295_071_038_359_329_407_638_749_915_472_431_954_854_861_596_397_549_936_831_379_021_908_016_447_259_697_687_234_297_933_532_391_249_843_399_805_538_180_367_843_619_841_105_826_855_103_639_913_758_028_813_723_300_791_602_357_673_671_012_299_708_765_309_432_730_963_991_123_005_078_335_482_395_327_797_535_106_295_643_624_740_329_352_255_501_375_748_672_535_527_193_789_665_507_357_555_817_541_345_478_963_055_862_624_739_041_058_470_854_218_776_219_520_806_880_638_928_190_056_262_766_143_089_502_759_727_118_966_328_880_673_601_294_991_904_351_315_028_521_140_821_708_405_605_932_746_373_636_850_913_815_113_290_823_972_293_351_282_235_725_808_659_531_277_623_288_240_849_734_175_467_831_212_525_294_888_118_492_959_489_864_485_918_151_642_587_458_734_410_033_337_622_544_077_413_028_695_283_380_368_767_181_479_892_612_504_713_230_656_931_198_088_738_609_203_137_788_426_633_569_997_862_563_743_141_374_722_052_604_058_913_879_463_255_099_086_506_309_875_071_660_547_882_251_479_554_574_877_401_078_163_406_400_436_402_710_027_743_074_473_767_762_252_502_397_648_151_588_450_403_445_632_467_677_615_700_383_594_581_649_687_733_555_941_310_158_451_422_004_255_312_136_797_920_367_600
p fibonacci(9360) == 595_425_921_730_945_112_107_130_132_090_393_300_229_903_283_289_718_837_556_159_188_372_974_362_918_243_433_749_274_562_940_048_317_303_635_436_499_520_159_904_476_195_880_906_251_245_515_777_401_254_460_159_331_249_753_994_426_538_843_027_178_422_577_862_169_348_175_872_920_048_863_916_616_937_756_729_603_892_326_847_069_625_430_121_308_754_980_621_820_357_003_989_754_581_563_523_146_593_143_335_306_294_629_592_776_027_580_486_483_982_302_205_729_745_310_232_872_808_566_544_075_573_415_004_729_548_757_875_287_156_082_412_908_004_571_462_712_382_980_584_223_853_555_625_397_335_151_567_031_070_436_032_355_503_865_756_332_759_997_161_999_219_489_006_236_083_656_478_584_828_799_824_720_987_007_434_471_006_978_279_286_828_150_743_484_346_859_020_336_934_473_244_543_563_695_439_575_276_252_710_616_938_060_651_056_868_645_855_319_630_729_608_568_768_155_785_750_538_856_164_488_658_905_263_010_860_471_867_705_227_386_327_854_805_920_672_076_453_745_664_918_207_782_164_904_039_933_618_916_198_406_595_359_658_739_053_978_859_003_566_550_250_128_670_612_968_762_837_430_022_907_140_110_065_797_465_350_899_207_394_028_439_329_467_155_836_009_348_584_003_707_196_875_579_903_000_882_345_125_307_843_054_796_515_219_414_596_205_513_015_553_693_814_174_445_128_710_864_620_278_238_042_033_351_257_252_714_283_738_488_750_390_015_399_611_326_617_189_944_717_789_809_683_670_343_559_570_842_036_558_493_076_862_540_008_964_362_791_219_327_344_590_922_907_404_279_744_110_490_076_662_093_538_116_459_004_998_258_397_129_451_322_171_741_050_916_118_718_721_171_388_996_464_128_619_500_358_491_576_341_335_915_051_940_275_897_831_538_673_297_834_255_933_839_479_373_709_888_990_810_761_551_868_558_265_531_510_795_578_229_053_572_481_567_812_427_737_497_111_511_667_208_666_620_477_489_456_216_036_930_987_039_635_975_776_218_090_969_992_186_101_340_408_126_047_240_887_119_643_607_246_810_606_958_825_358_016_370_291_198_393_469_028_566_984_622_917_862_049_170_525_592_085_223_389_032_619_189_187_232_674_929_333_032_215_289_948_186_564_341_197_201_705_210_042_094_227_248_896_772_999_582_374_427_283_592_515_162_763_084_618_707_885_836_470_192_782_417_093_322_197_408_918_476_486_537_355_150_092_342_141_969_852_243_304_259_433_694_016_712_994_738_268_166_456_488_217_784_538_789_799_534_417_010_622_215_198_781_249_165_303_449_894_081_774_953_567_303_240_878_135_168_651_857_340_270_207_626_550_089_776_579_663_976_863_025_772_393_293_267_004_285_694_911_122_075_278_647_170_050_488_960_248_511_370_151_382_612_651_060_366_131_974_451_965_499_737_645_125_995_563_446_528_998_359_782_508_533_107_151_523_520
# p fibonacci(9361) => Stack Overflow!
p fibonacci_iteration(20) == fibonacci(20)
p fibonacci_iteration(9300) == fibonacci(9300)
p fibonacci_iteration(10_000) == 33_644_764_876_431_783_266_621_612_005_107_543_310_302_148_460_680_063_906_564_769_974_680_081_442_166_662_368_155_595_513_633_734_025_582_065_332_680_836_159_373_734_790_483_865_268_263_040_892_463_056_431_887_354_544_369_559_827_491_606_602_099_884_183_933_864_652_731_300_088_830_269_235_673_613_135_117_579_297_437_854_413_752_130_520_504_347_701_602_264_758_318_906_527_890_855_154_366_159_582_987_279_682_987_510_631_200_575_428_783_453_215_515_103_870_818_298_969_791_613_127_856_265_033_195_487_140_214_287_532_698_187_962_046_936_097_879_900_350_962_302_291_026_368_131_493_195_275_630_227_837_628_441_540_360_584_402_572_114_334_961_180_023_091_208_287_046_088_923_962_328_835_461_505_776_583_271_252_546_093_591_128_203_925_285_393_434_620_904_245_248_929_403_901_706_233_888_991_085_841_065_183_173_360_437_470_737_908_552_631_764_325_733_993_712_871_937_587_746_897_479_926_305_837_065_742_830_161_637_408_969_178_426_378_624_212_835_258_112_820_516_370_298_089_332_099_905_707_920_064_367_426_202_389_783_111_470_054_074_998_459_250_360_633_560_933_883_831_923_386_783_056_136_435_351_892_133_279_732_908_133_732_642_652_633_989_763_922_723_407_882_928_177_953_580_570_993_691_049_175_470_808_931_841_056_146_322_338_217_465_637_321_248_226_383_092_103_297_701_648_054_726_243_842_374_862_411_453_093_812_206_564_914_032_751_086_643_394_517_512_161_526_545_361_333_111_314_042_436_854_805_106_765_843_493_523_836_959_653_428_071_768_775_328_348_234_345_557_366_719_731_392_746_273_629_108_210_679_280_784_718_035_329_131_176_778_924_659_089_938_635_459_327_894_523_777_674_406_192_240_337_638_674_004_021_330_343_297_496_902_028_328_145_933_418_826_817_683_893_072_003_634_795_623_117_103_101_291_953_169_794_607_632_737_589_253_530_772_552_375_943_788_434_504_067_715_555_779_056_450_443_016_640_119_462_580_972_216_729_758_615_026_968_443_146_952_034_614_932_291_105_970_676_243_268_515_992_834_709_891_284_706_740_862_008_587_135_016_260_312_071_903_172_086_094_081_298_321_581_077_282_076_353_186_624_611_278_245_537_208_532_365_305_775_956_430_072_517_744_315_051_539_600_905_168_603_220_349_163_222_640_885_248_852_433_158_051_534_849_622_434_848_299_380_905_070_483_482_449_327_453_732_624_567_755_879_089_187_190_803_662_058_009_594_743_150_052_402_532_709_746_995_318_770_724_376_825_907_419_939_632_265_984_147_498_193_609_285_223_945_039_707_165_443_156_421_328_157_688_908_058_783_183_404_917_434_556_270_520_223_564_846_495_196_112_460_268_313_970_975_069_382_648_706_613_264_507_665_074_611_512_677_522_748_621_598_642_530_711_298_441_182_622_661_057_163_515_069_260_029_861_704_945_425_047_491_378_115_154_139_941_550_671_256_271_197_133_252_763_631_939_606_902_895_650_288_268_608_362_241_082_050_562_430_701_794_976_171_121_233_066_073_310_059_947_366_875
# rubocop:enable Layout/LineLength