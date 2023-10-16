void main()
{
if(GetEnteringObject() == GetObjectByTag("M2Q2CTERARIBEAR") && GetLocalInt(GetModule(),"M2Q2TerariBashDoor") == 1)
    {
     ActionOpenDoor(GetObjectByTag("M2Q2HDOOR6"));
    }
}
