void main()
{
    if (GetTag(GetEnteringObject()) == "M2Q05CKASMA")
    {
        AssignCommand(GetObjectByTag("M2Q05PBOOMVOICE"),ActionStartConversation(OBJECT_SELF));
    }
}
