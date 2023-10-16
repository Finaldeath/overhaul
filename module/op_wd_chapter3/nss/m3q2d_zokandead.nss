//if Zokan is dead
int StartingConditional()
{
    int iResult;
    object oZokan = GetObjectByTag("Zokan3Q21");
    iResult = !GetIsObjectValid(oZokan);
    return iResult;
}
