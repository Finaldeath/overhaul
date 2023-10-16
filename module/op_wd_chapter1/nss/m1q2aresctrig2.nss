void main()
{
    object oEnter = GetEnteringObject();
    if(GetTag(oEnter) == "M1Q2AJohns" || GetTag(oEnter) == "M1Q2ADulcimae")
    {
        SetLocalInt(oEnter,"SeeStairs",TRUE);
        AssignCommand(oEnter,ClearAllActions());
        AssignCommand(oEnter,SpeakOneLinerConversation());
    }
}
