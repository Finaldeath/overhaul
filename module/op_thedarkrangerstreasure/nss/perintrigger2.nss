//::///////////////////////////////////////////////
//:: Perin's Trigger Text Bubble Script #2
//:: perintrigger2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes Perin to say a text bubble.
*/
//:://////////////////////////////////////////////

void main()
{
    //Verify that the entering object is Perin
    object oEnterer = GetEnteringObject();

    if (GetTag(oEnterer) == "Perin")
    {
        AssignCommand(oEnterer, SpeakString("Hi Talias! Did you miss me yet?"));
    }
}
