//::///////////////////////////////////////////////
//:: Perin's Trigger Text Bubble Script #5
//:: perintrigger5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes Perin to say a text bubble.
*/
//:://////////////////////////////////////////////

void main()
{
    //Verify that the entering object is Perin's Master
    object oPerin = GetObjectByTag("Perin");
    object oEnterer = GetEnteringObject();
    object oMaster = GetMaster(oPerin);

    if (oEnterer == oMaster)
    {
        //Verify that Perin is still alive.
        object oPerin = GetObjectByTag("Perin");

        if (oPerin != OBJECT_INVALID)
        {
            //if he is, get him to say a text bubble and make sure he only says it once.
            int iPerinBubble = GetLocalInt(OBJECT_SELF, "PerinBubble");

            if (iPerinBubble < 1)
            {
                SetLocalInt(OBJECT_SELF, "PerinBubble", 1);
                AssignCommand(oPerin, SpeakString("See? What did I tell you! These pesky louts fall easy as pie."));
            }
        }
    }
}
