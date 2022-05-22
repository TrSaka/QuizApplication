// ignore_for_file: non_constant_identifier_names

class QuestionModel {
  String question = "";
  Map<String, bool> answers;

  QuestionModel(this.question, this.answers);
}

String text0 = "";
String text1 = "Ayda ağırlık vardır";
String text2 = "Işık yolu uzaklık birimidir.";
String text3 = "Ağırlığın birimi Newtondur.";
String text4 = "Kütle vektöreldir.";
String text5 = "Ağırlığın temel birimi büyüklüktür.";
String text6 = "Ağırlık vektöreldir";
String text7 = "Uzayda kütle değişmez.";
String text8 = "Net kuvvette ivme her zaman aynı yönlüdür.";
String text9 = "Sürat yönlü bir büyüklüktür";
String text10 = "Hız vektörel bir büyüklüktür.";
String text11 = "Alınan yol vektöreldir.";
String text12 = "Pistte tam 1 tur atan aracın ortalama hızı sıfırdır.";
String text13 = "Net kuvveti sıfır olan bir cisim hareket etmez.";
String text14 = "Sürtünme kuvveti cismin taban alanına bağlıdır.";
String text15 = "Sürtünme kuvvetinin hareket ettirici özelliği vardır.";
String text16 = "Vücut ısımız 37.5 C 'dir doğru bir ifade midir ? ";
String text17 = "Isı ve sıcaklık farklı kavramlardır.";
String text18 = "Isı ve sıcaklık birimleri aynıdır.";
String text19 = "Isı termometreyle ölçülür.";
String text20 = "Sıcaklık termometreyle ölçülür.";
String text21 = "Isı alan maddenin her zaman sıcaklığı artar.";
String text22 = "Isının birimi kaloridir.";
String text23 = "Basınç vektöreldir.";
String text24 = "Ses boşlukta yayılır.";
String text25 = "Elektronun anti parçacığı protondur.";
String text26 = "Sıcaklık bir enerjidir.";
String text27 = "Yerçekimi ivmesi, yerin merkezine doğru artar.";
String text28 = "Modern fizik fiziğin alt dallarındandır.";
String text29 = "Elektron ve protonun yükleri aynı büyüklüktedir.";
String text30 = "Gerçek görüntü düzdür.";

String title = "Quizz Game";
String alt_title = "başlamak için oynaya basınız";
String but_title = "OYNA";
String over_text = "Test Bitti";
String over_score = "Skorunuz";
String over_but_title = "Tekrar Dene";
String quiz_but = "Pas";
String quiz_forward = "İlerle";
String quest_title = "Soru";
String last_but_changeable = "Sonuç";
String trues = "Doğru";
String falses = "Yanlış";
String text31 = "Ayarlar";
String text32 = "- Tema -";
String text33 = "Koyu Tema";
String text34 = "Açık Tema";
String text35 = "Skor Tablosu";
String text36 = "İstatikler";
String text37 = "Kullanıcı";
String text38 = "- En iyi skor";
String text39 = "- Son skor";
String text40 = "- Doğru";
String text41 = "- Yanlış";
String text42 = "- Pas";
String text43 = "Yükleniyor";

List scores = [0, 0, 0, 0, 0];

setList() {
  setList();
  scores.sort();
  scores = List.from(scores.reversed);
}
