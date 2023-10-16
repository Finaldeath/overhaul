void main()
{
    object oAlaefin = GetNearestObjectByTag("m1q2_Alaefin");

    AssignCommand(oAlaefin, ActionStartConversation(oAlaefin));
}
