void main()
{
    object oPlayer;
    object oStore;

    oPlayer = GetPCSpeaker();
    oStore = GetNearestObjectByTag("warriorstore");
    OpenStore(oStore,oPlayer);
}
