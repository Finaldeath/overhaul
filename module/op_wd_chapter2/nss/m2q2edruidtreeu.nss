void main()
{
if(GetLocalInt(GetModule(),"M2Q2SkeletonCaptainIsDead") == 1)
    {
     CreateItemOnObject("M2Q2ITLEAFOAK",GetLastUsedBy());
     SetLocalInt(GetModule(),"M2Q2SkeletonCaptainIsDead",2);
    }
}
