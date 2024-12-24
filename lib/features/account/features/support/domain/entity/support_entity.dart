class SupportEntity {
  final String titel, image, subtitel;
  final void Function()? onPressed;

  SupportEntity(
      {required this.titel,
      required this.image,
      required this.onPressed,
      required this.subtitel});
}
