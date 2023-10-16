void main()
{
    object oPlayer;
    object oStore;

    oPlayer = GetPCSpeaker();
    oStore = GetNearestObjectByTag("divinestore");
    OpenStore(oStore,oPlayer);
}
