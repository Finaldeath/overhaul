void main()
{
    object oSelf = OBJECT_SELF;
    string sTag = "PLAC_CONT_STONE_PED";
    object oAttacker = GetLastAttacker();
    object oTarget;
    object oHench;

    if (GetIsPC(oAttacker) == TRUE)
    {
        oHench = GetHenchman(oAttacker);

        if ((GetIsInCombat(oHench) == FALSE)
            && (GetIsObjectValid(oHench) == TRUE))
        {
            AssignCommand(oHench, SpeakString("Good idea!"));
            oTarget = GetNearestObjectByTag(sTag, oHench);

            AssignCommand(oHench, ActionAttack(oTarget));
        }
    }
}
