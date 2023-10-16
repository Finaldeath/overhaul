// * if Morag is attacked and is not
//* doing something, this sets her back into Combat mode
void main()
{
    // * If MORAG is still PLOT IMMUNE then
    // * this means the player interrupted her before she could talk
    // * So, what she does here is
    if (GetPlotFlag(OBJECT_SELF) == TRUE)
    {
        ExecuteScript("m4q1d08_breakc", OBJECT_SELF);
    }

    if (GetSpellTargetObject() == OBJECT_INVALID ||  GetAttemptedAttackTarget() == OBJECT_INVALID)
    {
        ActionAttack(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC));
    }
}
