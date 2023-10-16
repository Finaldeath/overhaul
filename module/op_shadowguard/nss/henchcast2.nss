// I am not casting spells during melee

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"DoNotCastMelee");
    return iResult;
}
