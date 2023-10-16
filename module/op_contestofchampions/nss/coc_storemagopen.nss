void main()
{
    object oPlayer;
    object oStore;

    oPlayer = GetPCSpeaker();
    oStore = GetNearestObjectByTag("magicstore");
    OpenStore(oStore,oPlayer);
}
