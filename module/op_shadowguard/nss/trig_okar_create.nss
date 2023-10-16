void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(OBJECT_SELF, "N_DO_OKAR_CREATE") == 0)
        {
            string s = "CT_UNIQ_NT_OK_0";

            object oWP = GetNearestObjectByTag("WP_" + s, oPC);

            location lWP = GetLocation(oWP);

            s = s + IntToString(GetLocalInt(GetModule(), "N_OKARIS_RACE"));

            object oOkar = CreateObject(OBJECT_TYPE_CREATURE, s, lWP);

            object oChair = GetNearestObjectByTag("PT_CT_UNIQ_NT_OK", oOkar);

            if (GetDistanceBetween(oChair, oOkar) <= 10.0)
                AssignCommand(oOkar, ActionSit(oChair));

            SetLocalInt(OBJECT_SELF, "N_DO_OKAR_CREATE", 1);
        }
    }
}
