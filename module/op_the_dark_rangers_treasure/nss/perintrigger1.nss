//::///////////////////////////////////////////////
//:: Perin's Trigger Text Bubble Script #1
//:: perintrigger1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes Perin to say a text bubble.
*/
//:://////////////////////////////////////////////

void main()
{
    object oPerin = GetObjectByTag("Perin");
    object oMaster = GetMaster(oPerin);
    object oEnterer = GetEnteringObject();
    int iMainPlot = GetLocalInt(GetModule(), "MainPlot");

    //Verify that Perin is a henchman and is still alive.
    if (oPerin != OBJECT_INVALID && GetIsPC(GetMaster(oPerin)) == TRUE)
    {

        //Check to see if player is on their way to the ruins
        if (iMainPlot < 2)
        {
            //Cause Perin to say this bubble but only once.
            int iPerinBubble1 = GetLocalInt(OBJECT_SELF, "PerinBubble1");

            if (iPerinBubble1 == FALSE)
            {
                SetLocalInt(OBJECT_SELF, "PerinBubble1", TRUE);
                AssignCommand(oPerin, SpeakString("Hidey-ho, away we go!"));
            }
        }

        //If Perin's master has just returned from the ruins, say a different bubble.
        else
        {
            int iPerinBubble2 = GetLocalInt(OBJECT_SELF, "PerinBubble2");

            if (iPerinBubble2 == FALSE)
            {
                if (oMaster == oEnterer)
                {
                    SetLocalInt(OBJECT_SELF, "PerinBubble2", TRUE);
                    AssignCommand(oPerin, SpeakString("Phew! We made it! Home sweet home..."));
                }
            }
        }
    }
}
