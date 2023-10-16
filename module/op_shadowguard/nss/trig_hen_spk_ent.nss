void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        object oHench = GetHenchman(oPC);

        if (GetIsObjectValid(oHench))
        {
            string sTag = GetTag(oHench);

            int nLength = GetStringLength(sTag);

            // Remove the TRIG_ from the front of sTag
            sTag = GetSubString(sTag, 6, nLength - 5);

            string sHench = GetStringLeft(sTag, 4);

            int nSpeakNumber = StringToInt(GetStringRight(sTag, 2));

            if (GetStringRight(GetTag(oHench), 4) == sHench)
            {
                SetLocalInt(oHench, "N_HENCH_SPEC_SPEAK", nSpeakNumber);
                AssignCommand(oPC, ActionStartConversation(oHench));
            }

            if (GetLocalInt(GetModule(), "N_TEST") == 1)
                SendMessageToPC(oPC, "[Entered special hench trigger: " + sHench + " , " + IntToString(nSpeakNumber) + ".]");
        }
    }
}
