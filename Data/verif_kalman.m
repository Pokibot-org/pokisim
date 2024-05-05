function verif_kalman(sim_file,test_file)
    sim_data = importdata(sim_file,' ',1);
    test_data = importdata(test_file,' ',1);
    
    figure('Name','Comparaison du Kalman Matlab et du Kalman Code C++ avec les memes donnees');
    plot(sim_data.data(:,7),sim_data.data(:,1),sim_data.data(:,7),sim_data.data(:,2),sim_data.data(:,7),sim_data.data(:,3),sim_data.data(:,7),sim_data.data(:,4),sim_data.data(:,7),sim_data.data(:,5),sim_data.data(:,7),sim_data.data(:,6));
    hold on;
    plot(test_data.data(:,7),test_data.data(:,1),test_data.data(:,7),test_data.data(:,2),test_data.data(:,7),test_data.data(:,3),test_data.data(:,7),test_data.data(:,4),test_data.data(:,7),test_data.data(:,5),test_data.data(:,7),test_data.data(:,6));
    legend('xhat1 sim','xhat2 sim','xhat3 sim','xhat4 sim','yhat1 sim','yhat2 sim','xhat1 C++','xhat2 C++','xhat3 C++','xhat4 C++','yhat1 C++','yhat2 C++');
    
    