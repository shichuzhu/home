function [ handle ] = HIWC_plot( fit_moments, psd_obs, obs_bin_mid, nml, bin_mid, nml2, bin_mid2, handle )
%HIWC_PLOT Plot HIWC data with the fitted moments
% [ handle ] = HIWC_plot( fit_moments, psd_obs, obs_bin_mid, nml, bin_mid, nml2, bin_mid2, handle )
% fit_moments moments to be plotted
% psd_obs
% obs_bin_mid
% nml
% bin_mid
% nml2
% bin_mid2
% handle handle to plot the moments
range_diff=10;

if ~exist('handle','var');
    handle=figure();
end
figure(handle);

if any(fit_moments==0)
    temp_moments=fit_moments;
else
    temp_moments=[0,fit_moments];
end
temp_moments=sort(temp_moments);

if ~exist('nml2','var')
    mode=1;
else
    mode=2;
end

columns=floor((length(temp_moments)+1)/2);
if length(temp_moments)==1
    row=1;
else
    row=2;
end

if mode==1
    
    erf1=0;
    if size(nml,1)>1
        erf1=1;
    end
    psd=nml(1,1).*bin_mid.^nml(1,2).*exp(-1.*nml(1,3).*bin_mid);
    for sz_plot=1:length(temp_moments)
        subplot(row,columns,sz_plot); hold on;
        if erf1==1
            for sz_erf1=2:size(nml,1)
                psd_erf1=nml(sz_erf1,1).*bin_mid.^nml(sz_erf1,2).*exp(-1.*nml(sz_erf1,3).*bin_mid);
                line3=plot( bin_mid, psd_erf1.*bin_mid.^temp_moments(sz_plot),'g');
            end
        end
        %%% Add equally realizable fits (ERF) here
        line1=plot( bin_mid, psd.*bin_mid.^temp_moments(sz_plot),'r');
        m_psd_obs=psd_obs.*obs_bin_mid.^temp_moments(sz_plot);
        line2=stairs( obs_bin_mid, m_psd_obs ,'k','linewidth',3);
        set(gca,'xscale','log','yscale','log');
        xlabel(['D (\mu','m)']);
        if temp_moments(sz_plot)==0
            ylabel(['N(D) (1/L/\mu','m)']);
        else
            ylabel(['Moment ',num2str(temp_moments(sz_plot)),'um^{j-1}/L']);
        end
        if sz_plot==1
            legend([line1,line3,line2],'Unimodal fit','Equally realizable','Observation');
        end
        
        ylim([min(m_psd_obs(m_psd_obs~=0))/range_diff,range_diff*max(m_psd_obs)]); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        limit=ylim;
        limit(1)=floor(log10(limit(1)));
        limit(2)=floor(1+log10(limit(2)));
        ax=gca;
        ax.YTick=logspace(limit(1),limit(2),limit(2)-limit(1)+1);
        grid on; bigfont;bigline;
    end
    C=nml(1,:);
    tstr=cellstr(['N0 = ',num2str(C(1)),' \mu = ',num2str(C(2)),' \lambda = ',num2str(C(3))]);
    commontitle(cell2mat(tstr));
    bigfont;
    
else
    
    erf1=0;
    erf2=0;
    if size(nml,1)>1
        erf1=1;
    end
    if size(nml2,1)>1
        erf2=1;
    end
    psd=nml(1,1).*bin_mid.^nml(1,2).*exp(-1.*nml(1,3).*bin_mid);
    psd2=nml2(1,1).*bin_mid2.^nml2(1,2).*exp(-1.*nml2(1,3).*bin_mid2);
    for sz_plot=1:length(temp_moments)
        subplot(row,columns,sz_plot); hold on;
        if erf1==1 && erf2==1
            for sz_erf1=2:size(nml,1)
                psd_erf1=nml(sz_erf1,1).*bin_mid.^nml(sz_erf1,2).*exp(-1.*nml(sz_erf1,3).*bin_mid);
                plot( bin_mid, psd_erf1.*bin_mid.^temp_moments(sz_plot),'g');
            end
            for sz_erf2=2:size(nml2,1)
                psd_erf2=nml2(sz_erf2,1).*bin_mid2.^nml2(sz_erf2,2).*exp(-1.*nml2(sz_erf2,3).*bin_mid2);
                plot( bin_mid2, psd_erf2.*bin_mid2.^temp_moments(sz_plot),'g');
            end
        else
            %error('Two modes of different intention of plot');
        end
        %%% Add equally realizable fits (ERF) here
        line1=plot( bin_mid, psd.*bin_mid.^temp_moments(sz_plot),'b');
        line2=plot( bin_mid2, psd2.*bin_mid2.^temp_moments(sz_plot),'b');
        m_psd_obs=psd_obs.*obs_bin_mid.^temp_moments(sz_plot);
        line3=stairs( obs_bin_mid, m_psd_obs,'k');
        set(gca,'xscale','log','yscale','log');
        xlabel(['D (\mu','m)']);
        if temp_moments(sz_plot)==0
            ylabel(['N(D) (1/L/\mu','m)']);
        else
            ylabel(['Moment ',num2str(temp_moments(sz_plot)),'um^{j-1}/L']);
        end
        if sz_plot==1
            legend([line1,line2,line3],'fitted mode 1','fitted mode 2','obs');
        end
        ylim([min(m_psd_obs(m_psd_obs~=0))/range_diff,range_diff*max(m_psd_obs)]); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        limit=ylim;
        limit(1)=floor(log10(limit(1)));
        limit(2)=floor(1+log10(limit(2)));
        ax=gca;
        ax.YTick=logspace(limit(1),limit(2),limit(2)-limit(1)+1);
        grid on; bigfont;bigline;
        
    end
    Ct=[nml(1,:);nml2(1,:)];
    tstr=cell(1,2);
    for szi_mode=1:mode
        C=Ct(szi_mode,:);
        tstr(szi_mode)=cellstr(['mode ',num2str(szi_mode),' N0 = ',num2str(C(1)),' \mu = ',num2str(C(2)),' \lambda = ',num2str(C(3))]);
    end
    commontitle([cell2mat(tstr(1)),char(10),cell2mat(tstr(2))]);
    bigfont;
    
end

end