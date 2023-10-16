//::///////////////////////////////////////////////
//:: Perin's Trigger Text Bubble Script #4
//:: perintrigger4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes Perin to say a text bubble.
*/
//:://////////////////////////////////////////////

void main()
{
    //Verify that the Clicking object is Perin's Master
    object oPerin = GetObjectByTag("Perin");
    object oClicker = GetClickingObject();
    object oMaster = GetMaster(oPerin);

    if (oClicker == oMaster)
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
                AssignCommand(oPerin, SpeakString("That's the road back to Gardensfeldt. Talias seals it off at night."));
            }
        }
    }
}
