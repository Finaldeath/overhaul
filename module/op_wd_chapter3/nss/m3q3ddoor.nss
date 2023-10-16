//* destroy fire elemental if door is managed to be opened or bashed
void main()
{
    object oFire = GetNearestObjectByTag("M3Q3CFIREGUARD");
    if (GetIsObjectValid(oFire) == TRUE)
    {
        DestroyObject(oFire);
    }
}
