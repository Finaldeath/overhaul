// I am casting spells even during melee

int StartingConditional()
{
    int iResult;

    iResult = 1-GetLocalInt(OBJECT_SELF,"DoNotCastMelee");
    return iResult;
}
