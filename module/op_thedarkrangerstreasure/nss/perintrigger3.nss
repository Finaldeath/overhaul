//::///////////////////////////////////////////////
//:: Perin's Trigger Text Bubble Script #3
//:: perintrigger3
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
        if (oPerin != OBJECT_INVALID)
        {
            //if he is, get him to say a text bubble and make sure he only says it once.
            int iPerinBubble = GetLocalInt(OBJECT_SELF, "PerinBubble");

            if (iPerinBubble < 1)
            {
                SetLocalInt(OBJECT_SELF, "PerinBubble", 1);
                AssignCommand(oPerin, SpeakString("Phew! Don't mind the smell. Now where were those ruins... North, I think."));
            }
        }
    }
}
