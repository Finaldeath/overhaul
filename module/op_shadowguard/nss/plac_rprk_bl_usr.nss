void main()
{
    object o1;
    object o2;
    location l;

    int n = GetUserDefinedEventNumber();

    switch (n)
    {
        // for creating special rope case
        case 1001:

                if (GetLocalInt(GetModule(), "N_TEST") == 1)
                    SendMessageToPC(GetFirstPC(), "[Entering the boulder's custom user defined script...]");

                o1 = GetNearestObjectByTag("WP_PC_ROPE_L");
                l = GetLocation(o1);

                o2 = CreateObject(OBJECT_TYPE_PLACEABLE, "PLAC_PC_ROPE", l);

                SetLocalObject(o2, "O_COLLABORATOR", OBJECT_SELF);

                SetLocalObject(OBJECT_SELF, "O_ROPE", o2);

                if (GetLocalInt(GetModule(), "N_TEST") == 1)
                    SendMessageToPC(GetFirstPC(), "[Exiting the boulder's custom user defined script, rope should be created...]");

            break;

        default: break;
    }
}
