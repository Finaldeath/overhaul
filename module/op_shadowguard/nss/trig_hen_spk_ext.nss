void main()
{
    object oPC = GetExitingObject();

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

            if (GetStringRight(GetTag(oHench), 4) == sHench)
                SetLocalInt(oHench, "N_HENCH_SPEC_SPEAK", 0);


            if (GetLocalInt(GetModule(), "N_TEST") == 1)
                SendMessageToPC(oPC, "[Exiting special hench trigger: " + sHench + " , 0.]");
        }
    }
}
