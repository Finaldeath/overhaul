// Henchman is healing at close range

int StartingConditional()
{
    int iResult;

    iResult = 1-GetLocalInt(OBJECT_SELF,"DoNotHealMelee");
    return iResult;
}
