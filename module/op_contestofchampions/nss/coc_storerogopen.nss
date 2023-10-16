void main()
{
    object oPlayer;
    object oStore;

    oPlayer = GetPCSpeaker();
    oStore = GetNearestObjectByTag("roguestore");
    OpenStore(oStore,oPlayer);
}
