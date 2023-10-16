 #include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult =  CheckIntelligenceNormal() && GetLocalInt(GetObjectByTag("M2Q2CTERARI"),"M2Q2HDoorOpenAttempt") == 1
                && GetLocalInt(GetModule(),"M2Q2TerariIsFree") == 0;

	return l_iResult;
}
