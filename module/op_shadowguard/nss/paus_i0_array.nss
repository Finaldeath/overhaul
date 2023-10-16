// Generic Array Manipulation Routines

void MySetIntArray(object oSource, string sName, int iElem, int iState)
{
    string sFull = sName+IntToString(iElem);
    SetLocalInt(oSource,sFull,iState);
}

void MySetObjectArray(object oSource, string sName, int iElem, object oElem)
{
    string sFull = sName+IntToString(iElem);
    SetLocalObject(oSource,sFull,oElem);
}

object MyGetObjectArray(object oSource, string sName, int iElem)
{
    string sFull = sName+IntToString(iElem);
    return GetLocalObject(oSource,sFull);
}

int MyGetIntArray(object oSource, string sName, int iElem)
{
    string sFull = sName+IntToString(iElem);
    return GetLocalInt(oSource,sFull);
}


