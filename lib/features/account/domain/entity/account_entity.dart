class AccountEntity {
  final String titel, image;
  final void Function()? onPressed;

  AccountEntity(
      {required this.titel, required this.image, required this.onPressed});
}
