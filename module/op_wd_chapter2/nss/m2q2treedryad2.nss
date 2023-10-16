void main()
{
//* Display string for linked dryad

        string sNumber = GetStringRight(GetTag(OBJECT_SELF),1);
        object oDryad = GetObjectByTag("M2Q2CDRYAD" + sNumber);
        SetLocalInt(oDryad,"M2Q2DryadTreeAttacked",1);
        AssignCommand(oDryad,ActionStartConversation(OBJECT_SELF));
}
