// Henchman is not healing at close range

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"DoNotHealMelee");
    return iResult;
}
