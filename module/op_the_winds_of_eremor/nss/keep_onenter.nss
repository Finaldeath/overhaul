//::///////////////////////////////////////////////
//:: Keep Iridor - Area OnEnter Script
//:: Keep_OnEnter.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Remove Christer and Captain Jord from the
    Mount Iridor area in case the player chose not
    to talk to them.

    Cause Lord Eremoror to say his text bubble.
*/
//:://////////////////////////////////////////////

void main()
{
    object oEnterer = GetEnteringObject();

    if (GetIsPC(oEnterer) == TRUE)
    {
        int iDoOnce = GetLocalInt(OBJECT_SELF, "DoOnce");

        if (iDoOnce == FALSE)
        {
            //Removing Christer & Captain Jord
            object oChrister = GetObjectByTag("Christer");
            object oJord = GetObjectByTag("CaptainJord");

            DestroyObject(oChrister);
            DestroyObject(oJord);

            //Cause Lord Eremor to say his text bubble.
            object oEremor = GetObjectByTag("LordEremor");

            DelayCommand(2.0, AssignCommand(oEremor, ActionStartConversation(oEremor)));

            //Prevent this script from repeating the above actions
            SetLocalInt(OBJECT_SELF, "DoOnce", TRUE);
        }
    }
}
