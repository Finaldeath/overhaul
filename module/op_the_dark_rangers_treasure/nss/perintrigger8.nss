//::///////////////////////////////////////////////
//:: Perin's Trigger Text Bubble Script #8
//:: perintrigger8
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes Perin to say a text bubble. Adds a
    journal entry.
*/
//:://////////////////////////////////////////////

void main()
{
    //Add journal entry.
    object oEnterer = GetEnteringObject();
    AddJournalQuestEntry("DarkRanger", 40, oEnterer);

    //Verify that the entering object is Perin's Master
    object oPerin = GetObjectByTag("Perin");
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
                AssignCommand(oPerin, SpeakString("Come on, let's gather up as much as we can carry! We'll live like sultans!"));
            }
        }
    }
}
